<span class="copyright-year">
    {% set current = date(Date.now(), "YYYY") %}
        &copy;
    {% if theme.since and theme.since != current %}
        {{ theme.since }} -
    {% endif %}
    {{ current }}
    <span class="footer-author">{{ config.author }}.</span>
    <span class="power-by">
        {{ __('footer.powered', '<a class="hexo-link" href="https://hexo.io/">Hexo</a> and <a class="theme-link" href="https://github.com/frostfan/hexo-theme-polarbear">Polar Bear</a>') }}
    </span>
</span>
{% if theme.mermaid.enable %}
  <script src='https://unpkg.com/mermaid@{{theme.mermaid.version}}/dist/mermaid.min.js'></script>
  <script>
    if (window.mermaid) {
      mermaid.initialize({theme: 'forest'});
    }
  </script>
{% endif %}
