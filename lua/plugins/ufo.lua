--- @module 'lazy'
--- @type LazySpec
return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  event = 'LspAttach',
  config = function()
    require('ufo').setup()
    vim.opt.foldlevel = 99
  end,
}
