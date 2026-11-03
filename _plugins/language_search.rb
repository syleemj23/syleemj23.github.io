# Site-local language filtering for the installed al_search plugin.
# Place this file in _plugins/language_search.rb.
require 'al_search'
require 'json'
require 'cgi'

module SiteLanguageSearch
  module FilterResults
    def render(context)
      original_html = super
      site = context.registers[:site]
      return original_html unless site && site.config['search_enabled']

      current_page = context.registers[:page] || {}
      language = (current_page['lang'] || site.config['lang'] || 'ko').to_s
      labels = language == 'ko' ?
        { 'pages' => '메뉴', 'posts' => '지식창고', 'projects' => '프로젝트' } :
        { 'pages' => 'Navigation', 'posts' => 'Notes', 'projects' => 'Projects' }
      records = []
      baseurl = site.config.fetch('baseurl', '').to_s.sub(%r{/+$}, '')
      relative_url = lambda do |url|
        "#{baseurl}/#{url.to_s.sub(%r{^/+}, '')}"
      end
      eligible = lambda do |data|
        data['lang'].to_s == language && data['search'] != false && data['published'] != false
      end
      add_record = lambda do |document, section|
        data = document.data
        return unless eligible.call(data)
        return if data['inline']

        title = data['title'].to_s
        return if title.empty?

        destination = data['redirect'].to_s
        destination = document.url if destination.empty?
        external = destination.match?(%r{\Ahttps?://}i)
        # Only site-relative paths and HTTP(S) destinations are accepted.
        return if !external && (destination.start_with?('//') || destination.match?(%r{\A[a-z][a-z0-9+.-]*:}i))
        description = data['description'].to_s.gsub(/<[^>]*>/, ' ').gsub(/\s+/, ' ').strip
        records << {
          'id' => "language-content-#{records.length}",
          'title' => CGI.escapeHTML(title),
          'description' => CGI.escapeHTML(description),
          'section' => section,
          'destination' => external ? destination : relative_url.call(destination),
          'external' => external
        }
      end

      # English navigation pages intentionally have nav:false in this site.
      primary_urls = language == 'en' ? ['/en/', '/en/projects/', '/en/blog/'] : ['/', '/projects/', '/blog/']
      site.pages.sort_by { |p| p.data['nav_order'].to_f }.each do |p|
        next unless p.data['autogen'].nil?
        next if p.data['dropdown']
        next unless p.data['nav'] || primary_urls.include?(p.url)
        add_record.call(p, labels['pages'])
      end
      if site.config['posts_in_search']
        site.posts.docs.sort_by(&:date).reverse_each do |post|
          add_record.call(post, labels['posts'])
        end
      end
      site.collections.each do |name, collection|
        next if name == 'posts'
        collection.docs.each do |document|
          add_record.call(document, labels[name] || name.capitalize)
        end
      end

      # Replace only content/navigation results. Preserve original social and
      # theme commands, including their handlers, rather than rebuilding them.
      prefixes = ['nav-', 'dropdown-', 'post-', 'language-content-']
      prefixes.concat(site.collections.keys.map { |name| "#{name}-" })
      payload = JSON.generate({
        'records' => records,
        'prefixes' => prefixes,
        'placeholder' => language == 'ko' ? '검색어를 입력하세요' : 'Type to start searching'
      }).gsub('<') { '\u003c' }.gsub('>') { '\u003e' }.gsub('&') { '\u0026' }
        .gsub("\u2028") { '\u2028' }.gsub("\u2029") { '\u2029' }

      original_html + <<~HTML
        <script data-language-search="#{CGI.escapeHTML(language)}">
          (() => {
            const settings = #{payload};
            const search = document.querySelector('ninja-keys');
            if (!search) return;
            const commands = (Array.isArray(search.data) ? search.data : []).filter(
              item => !settings.prefixes.some(prefix => String(item.id || '').startsWith(prefix))
            );
            const content = settings.records.map(record => ({
              id: record.id,
              title: record.title,
              description: record.description,
              section: record.section,
              handler: () => {
                if (record.external) {
                  window.open(record.destination, '_blank', 'noopener,noreferrer');
                } else {
                  window.location.href = record.destination;
                }
              }
            }));
            search.data = [...content, ...commands];
            search.setAttribute('placeholder', settings.placeholder);
          })();
        </script>
      HTML
    end
  end
end

unless AlSearch::SearchAssetsTag.ancestors.include?(SiteLanguageSearch::FilterResults)
  AlSearch::SearchAssetsTag.prepend(SiteLanguageSearch::FilterResults)
end
