return {
  {
    'navarasu/onedark.nvim',
    config = function()
      local od = require 'onedark'
      od.setup {
        style = 'darker',
        transparent = true,
      }
      od.load()
    end,
  },
}
