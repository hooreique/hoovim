return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local t = require 'telescope'
      local b = require 'telescope.builtin'

      t.setup {
        pickers = {
          find_files = { theme = 'ivy' },
          live_grep  = { theme = 'ivy' },
          buffers    = { theme = 'ivy' },
          help_tags  = { theme = 'ivy' },
        },
        extensions = { fzf = {} },
      }

      t.load_extension 'fzf'

      vim.keymap.set('n', '<Space>if', b.find_files)
      vim.keymap.set('n', '<Space>ig', b.live_grep)
      vim.keymap.set('n', '<Space>ib', b.buffers)
      vim.keymap.set('n', '<Space>ih', b.help_tags)

      vim.keymap.set('n', '<Space>im', function()
        require('config.telescope.multigrep').find()
      end)
    end,
  },
}
