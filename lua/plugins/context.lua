--- @module 'lazy'
--- @type LazySpec
return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },

  --- @module 'treesitter-context'
  --- @type TSContext.UserConfig
  opts = {
    max_lines = 3,
    min_window_height = 10,
  },
}
