return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = { nerd_font_variant = 'normal' },
    signature = { enabled = true },
    cmdline = {
      completion = { menu = { auto_show = true } },
      keymap = { ['<Tab>'] = { 'show', 'accept' } },
    },
  },
}
