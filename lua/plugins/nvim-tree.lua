---@type vim.keymap.set.Opts
local o = { noremap = true, nowait = true, silent = true }

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local api = require 'nvim-tree.api'

    require('nvim-tree').setup {
      hijack_netrw = false,

      ---@param bufnr integer
      on_attach = function(bufnr)
        ---@param desc string
        ---@return vim.keymap.set.Opts
        local opts = function(desc)
          return { buffer = bufnr, desc = desc, noremap = true, nowait = true, silent = true }
        end

        vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
        vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', '<Right>', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', '<CR>', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', 'i', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', '<Left>', api.node.navigate.parent, opts 'Parent Directory')
        vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts 'Close Directory')
        vim.keymap.set('n', 'n', api.node.navigate.parent_close, opts 'Close Directory')
        vim.keymap.set('n', 'h', api.tree.collapse_all, opts 'Collapse')
      end,
    }

    vim.keymap.set('n', '<', function()
      if api.tree.is_visible() then
        api.tree.close()
      end
    end, o)

    vim.keymap.set('n', '>', function()
      if api.tree.is_visible() then
        api.tree.focus()
      else
        api.tree.open()
        vim.cmd.wincmd 'p'
      end
    end, o)
  end,
}
