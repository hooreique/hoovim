--- @module 'lazy'
--- @type LazySpec
return {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('todo-comments').setup {}

    vim.keymap.set('n', '<Space>"t', ':<C-U>TodoTelescope<CR>', {
      noremap = true,
      nowait = true,
      desc = 'hoo: todo-comments: Telescope',
    })
  end,
}
