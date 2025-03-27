return {
  "zk-org/zk-nvim",
  config = function()
    if vim.fn.executable 'zk' == 1 then
      require('zk').setup {}
    end
  end,
}
