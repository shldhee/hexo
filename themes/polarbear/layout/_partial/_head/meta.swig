<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1,minimum-scale=1,maximum-scale=1">
<link rel="canonical" href="https://hasudoki.tistory.com/">

{# Disable transformation #}
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

{# redirect #}
{% if page.redirect %}
<meta http-equiv="refresh" content="0; url={{ page.redirect }}" />

{% endif %}

{# Website description #}
{% if page.description %}
  <meta name="description" content="{{ page.description }}"/>
{% elif page.title %}
  <meta name="description" content="{{ page.title }}"/>
{% elif config.description %}
  <meta name="description" content="{{ config.description }}"/>
{% endif %}

{# Website keywords #}
{% if page.keywords %}
  <meta name="keywords" content="{{ page.keywords }}" />
{% elif page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% endif %}
