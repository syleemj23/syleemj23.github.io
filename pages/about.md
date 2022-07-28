---
layout: page
title: About
permalink: /about/
weight: 3
---

# **About Me**

Hi I am **{{ site.author.name }}** :wave:,<br>
I am currently studying Digital Forensics at George Mason University.
Previously, I majored in Computer Science at Oregon State University, so one interest associated with the current field is to develop Digital Forensic tools with my programming skills.
The information below gives a glance at both my skills and academic background.
Please feel free to contact me for my resume or any questions through any contact venues at the bottom.

<div class="row">
{% include about/skills.html title="Programming Skills" source=site.data.programming-skills %}
{% include about/skills.html title="Digital-Forensics Skills" source=site.data.other-skills %}
</div>

<div class="row">
{% include about/timeline.html %}
</div>