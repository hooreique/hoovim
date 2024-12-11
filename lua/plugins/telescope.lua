return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = { theme = 'ivy' },
          live_grep = { theme = 'ivy' },
          buffers = { theme = 'ivy' },
          help_tags = { theme = 'ivy' },
        },
      }

      local bi = require 'telescope.builtin'

      vim.keymap.set('n', '<Space>if', bi.find_files)
      vim.keymap.set('n', '<Space>ig', bi.live_grep)
      vim.keymap.set('n', '<Space>ib', bi.buffers)
      vim.keymap.set('n', '<Space>ih', bi.help_tags)
    end,
  },
}
