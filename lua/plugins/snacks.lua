--- @param desc string
--- @return vim.keymap.set.Opts
local function o(desc)
  return {
    noremap = true,
    nowait = true,
    desc = 'hoo: snacks: ' .. desc,
  }
end

--- @module 'lazy'
--- @type LazySpec
return {
  'folke/snacks.nvim',
  config = function()
    require 'snacks'.setup {
      words = { enabled = true },
      lazygit = { enacled = true },
    }

    local jump = require('snacks.words').jump

    vim.keymap.set('n', 'a', function()
      jump(1, true)
    end, o 'words: Jump Forward')
    vim.keymap.set('n', 'A', function()
      jump(-1, true)
    end, o 'words: Jump Backward')

    vim.keymap.set('n', ',g', function()
      require('snacks.lazygit').open()
    end, o 'lazygit: Open')
  end,
}
