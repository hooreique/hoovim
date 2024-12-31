return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require 'snacks'.setup {
      words = { enabled = true },
    }

    vim.keymap.set('n', '<Space>a', function()
      require('snacks.words').jump(1, true)
    end, {
      noremap = true,
      nowait = true,
      desc = 'hoo: snacks: words:',
    })
  end,
}
