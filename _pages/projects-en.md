---
layout: page
title: Projects
permalink: /en/projects/
description: Goals, processes, and results from my digital forensics projects.
lang: en
translation_url: /projects/
nav: false
horizontal: false
---

{% assign english_projects = site.projects | where: "lang", "en" %}
{% assign sorted_projects = english_projects | sort: "importance" %}

<div class="projects">
  {% if sorted_projects.size == 0 %}
    <p>English project write-ups are not available yet.</p>
  {% else %}
    {% if page.horizontal %}
      <div class="container">
        <div class="row row-cols-1 row-cols-md-2">
          {% for project in sorted_projects %}
            {% include projects_horizontal.liquid %}
          {% endfor %}
        </div>
      </div>
    {% else %}
      <div class="row row-cols-1 row-cols-md-3">
        {% for project in sorted_projects %}
          {% include projects.liquid %}
        {% endfor %}
      </div>
    {% endif %}
  {% endif %}
</div>
