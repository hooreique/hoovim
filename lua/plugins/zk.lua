--- @module 'lazy'
--- @type LazySpec
return {
  "zk-org/zk-nvim",
  enabled = function()
    return vim.fn.executable 'zk' == 1
  end,
  config = true,
}
