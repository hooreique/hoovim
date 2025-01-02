---@param desc string
---@return vim.keymap.set.Opts
local function o(desc)
  return {
    noremap = true,
    nowait = true,
    desc = 'hoo: treesitter: ' .. desc,
  }
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        auto_install = true,
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100KB
            ---@diagnostic disable-next-line: undefined-field
            local ok, stats = pcall(vim.loop.fs_stat,
              vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
      }

      local ne = require('config.treesitter.node-ends')

      vim.keymap.set(
        { 'n', 'v' }, '[',
        ne.compose(ne.inner, ne.goto_start),
        o 'Go to Start of Current Node')

      vim.keymap.set(
        { 'n', 'v' }, ']',
        ne.compose(ne.inner, ne.goto_end),
        o 'Go to End of Current Node')

      vim.keymap.set(
        { 'n', 'v' }, '{',
        ne.compose(ne.outer, ne.goto_start),
        o 'Go to Start of Current Node')

      vim.keymap.set(
        { 'n', 'v' }, '}',
        ne.compose(ne.outer, ne.goto_end),
        o 'Go to End of Current Node')
    end,
  },
}
