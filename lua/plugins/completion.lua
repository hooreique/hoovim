-- See https://cmp.saghen.dev/installation.html#lazy-nvim
--- @module 'lazy'
--- @type LazySpec
return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    {
      "folke/lazydev.nvim",
      ft = "lua",

      --- @module 'lazydev'
      --- @type lazydev.Config
      opts = {
        --- @module 'lazydev'
        --- @type lazydev.Library.spec[]
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  version = '1.*',

  -- opts_extend = { "sources.default" }, <- 이거 뭔지 모르겠어서 안 씀

  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    appearance = { nerd_font_variant = 'normal' },
    completion = {
      documentation = { auto_show = true },
      ghost_text = { enabled = true },
      menu = { auto_show = true },
      trigger = { prefetch_on_insert = true },
    },
    cmdline = {
      enabled = true,
      completion = {
        ghost_text = { enabled = true },
        menu = { auto_show = true },
      },
    },
    signature = { enabled = true },
    sources = {
      default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'cmdline' },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
  },
}
