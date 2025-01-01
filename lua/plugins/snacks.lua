---@param desc string
---@return vim.keymap.set.Opts
local function o(desc)
  return {
    noremap = true,
    nowait = true,
    desc = 'hoo: snacks: words: ' .. desc,
  }
end

return {
  'folke/snacks.nvim',
  config = function()
    require 'snacks'.setup {
      words = { enabled = true },
    }

    local jump = require('snacks.words').jump

    vim.keymap.set('n', 'a', function() jump(1, true) end, o 'Jump Forward')
    vim.keymap.set('n', 'A', function() jump(-1, true) end, o 'Jump Backward')
  end,
}
