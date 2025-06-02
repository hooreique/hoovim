--- @module 'lazy'
--- @type LazySpec
return {
  'zk-org/zk-nvim',
  main = 'zk',
  config = true,
  enabled = function()
    return vim.fn.executable 'zk' == 1
  end,
}
