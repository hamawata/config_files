return {
  'saghen/blink.cmp',
  -- v2 is under active development on `main`; pin to the stable v1 line.
  version = '1.*',
  dependencies = { 'rafamadriz/friendly-snippets' },
  opts = {
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'mono' },
    completion = { documentation = { auto_show = true } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}
