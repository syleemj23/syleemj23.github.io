---
layout: page
title: 프로젝트
permalink: /projects/
description: 디지털포렌식 프로젝트의 목표, 진행 과정과 결과를 정리합니다.
nav: true
nav_order: 1
lang: ko
translation_url: /en/projects/
horizontal: false
---

{% assign korean_projects = site.projects | where: "lang", "ko" %}
{% assign sorted_projects = korean_projects | sort: "importance" %}

<div class="projects">
  {% if sorted_projects.size == 0 %}
    <p>아직 등록된 한국어 프로젝트가 없습니다.</p>
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