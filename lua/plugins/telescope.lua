return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local ts = require 'telescope.builtin'

      vim.keymap.set('n', '<Space>ad', ts.find_files)
    end,
  },
}
