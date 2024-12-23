---@type vim.keymap.set.Opts
local opt = { noremap = true, nowait = true, silent = true }

---@param bufnr integer
---@return vim.keymap.set.Opts
local o = function(bufnr)
  return { buffer = bufnr, noremap = true, nowait = true, silent = true }
end

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local api = require 'nvim-tree.api'
    local view = require 'nvim-tree.view'
    local lib = require 'nvim-tree.lib'

    require('nvim-tree').setup {
      hijack_netrw = false,

      ---@param bufnr integer
      on_attach = function(bufnr)
        -- Help
        vim.keymap.set('n', '?', api.tree.toggle_help, o(bufnr))
        -- Open
        vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, o(bufnr))
        -- Open
        vim.keymap.set('n', '<CR>', api.node.open.edit, o(bufnr))
        -- Open
        vim.keymap.set('n', 'i', api.node.open.edit, o(bufnr))
        -- Parent Directory
        vim.keymap.set('n', '<BS>', api.node.navigate.parent, o(bufnr))
        -- Close Directory
        vim.keymap.set('n', 'n', api.node.navigate.parent_close, o(bufnr))
        -- Collapse
        vim.keymap.set('n', 'h', api.tree.collapse_all, o(bufnr))
        -- CD
        -- vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, o(bufnr))
        -- Open: In Place
        -- vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, o(bufnr))
        -- Info
        -- vim.keymap.set('n', '<C-k>', api.node.show_info_popup, o(bufnr))
        -- Rename: Omit Filename
        -- vim.keymap.set('n', '<C-r>', api.fs.rename_sub, o(bufnr))
        -- Open: New Tab
        -- vim.keymap.set('n', '<C-t>', api.node.open.tab, o(bufnr))
        -- Open: Vertical Split
        -- vim.keymap.set('n', '<C-v>', api.node.open.vertical, o(bufnr))
        -- Open: Horizontal Split
        -- vim.keymap.set('n', '<C-x>', api.node.open.horizontal, o(bufnr))
        -- Close Directory
        -- vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, o(bufnr))
        -- Open
        -- vim.keymap.set('n', '<CR>', api.node.open.edit, o(bufnr))
        -- Open Preview
        -- vim.keymap.set('n', '<Tab>', api.node.open.preview, o(bufnr))
        -- Next Sibling
        -- vim.keymap.set('n', '>', api.node.navigate.sibling.next, o(bufnr))
        -- Previous Sibling
        -- vim.keymap.set('n', '<', api.node.navigate.sibling.prev, o(bufnr))
        -- Run Command
        -- vim.keymap.set('n', '.', api.node.run.cmd, o(bufnr))
        -- Up
        -- vim.keymap.set('n', '-', api.tree.change_root_to_parent, o(bufnr))
        -- Create File Or Directory
        -- vim.keymap.set('n', 'a', api.fs.create, o(bufnr))
        -- Delete Bookmarked
        -- vim.keymap.set('n', 'bd', api.marks.bulk.delete, o(bufnr))
        -- Trash Bookmarked
        -- vim.keymap.set('n', 'bt', api.marks.bulk.trash, o(bufnr))
        -- Move Bookmarked
        -- vim.keymap.set('n', 'bmv', api.marks.bulk.move, o(bufnr))
        -- Toggle Filter: No Buffer
        -- vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, o(bufnr))
        -- Copy
        -- vim.keymap.set('n', 'c', api.fs.copy.node, o(bufnr))
        -- Toggle Filter: Git Clean
        -- vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, o(bufnr))
        -- Prev Git
        -- vim.keymap.set('n', '[c', api.node.navigate.git.prev, o(bufnr))
        -- Next Git
        -- vim.keymap.set('n', ']c', api.node.navigate.git.next, o(bufnr))
        -- Delete
        -- vim.keymap.set('n', 'd', api.fs.remove, o(bufnr))
        -- Trash
        -- vim.keymap.set('n', 'D', api.fs.trash, o(bufnr))
        -- Expand All
        -- vim.keymap.set('n', 'E', api.tree.expand_all, o(bufnr))
        -- Rename: Basename
        -- vim.keymap.set('n', 'e', api.fs.rename_basename, o(bufnr))
        -- Next Diagnostic
        -- vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, o(bufnr))
        -- Prev Diagnostic
        -- vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, o(bufnr))
        -- Live Filter: Clear
        -- vim.keymap.set('n', 'F', api.live_filter.clear, o(bufnr))
        -- Live Filter: Start
        -- vim.keymap.set('n', 'f', api.live_filter.start, o(bufnr))
        -- Help
        -- vim.keymap.set('n', 'g?', api.tree.toggle_help, o(bufnr))
        -- Copy Absolute Path
        -- vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, o(bufnr))
        -- Copy Basename
        -- vim.keymap.set('n', 'ge', api.fs.copy.basename, o(bufnr))
        -- Toggle Filter: Dotfiles
        -- vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, o(bufnr))
        -- Toggle Filter: Git Ignore
        -- vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, o(bufnr))
        -- Last Sibling
        -- vim.keymap.set('n', 'J', api.node.navigate.sibling.last, o(bufnr))
        -- First Sibling
        -- vim.keymap.set('n', 'K', api.node.navigate.sibling.first, o(bufnr))
        -- Toggle Group Empty
        -- vim.keymap.set('n', 'L', api.node.open.toggle_group_empty, o(bufnr))
        -- Toggle Filter: No Bookmark
        -- vim.keymap.set('n', 'M', api.tree.toggle_no_bookmark_filter, o(bufnr))
        -- Toggle Bookmark
        -- vim.keymap.set('n', 'm', api.marks.toggle, o(bufnr))
        -- Open
        -- vim.keymap.set('n', 'o', api.node.open.edit, o(bufnr))
        -- Open: No Window Picker
        -- vim.keymap.set('n', 'O', api.node.open.no_window_picker, o(bufnr))
        -- Paste
        -- vim.keymap.set('n', 'p', api.fs.paste, o(bufnr))
        -- Parent Directory
        -- vim.keymap.set('n', 'P', api.node.navigate.parent, o(bufnr))
        -- Close
        -- vim.keymap.set('n', 'q', api.tree.close, o(bufnr))
        -- Rename
        -- vim.keymap.set('n', 'r', api.fs.rename, o(bufnr))
        -- Refresh
        -- vim.keymap.set('n', 'R', api.tree.reload, o(bufnr))
        -- Run System
        -- vim.keymap.set('n', 's', api.node.run.system, o(bufnr))
        -- Search
        -- vim.keymap.set('n', 'S', api.tree.search_node, o(bufnr))
        -- Rename: Full Path
        -- vim.keymap.set('n', 'u', api.fs.rename_full, o(bufnr))
        -- Toggle Filter: Hidden
        -- vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, o(bufnr))
        -- Collapse
        -- vim.keymap.set('n', 'W', api.tree.collapse_all, o(bufnr))
        -- Cut
        -- vim.keymap.set('n', 'x', api.fs.cut, o(bufnr))
        -- Copy Name
        -- vim.keymap.set('n', 'y', api.fs.copy.filename, o(bufnr))
        -- Copy Relative Path
        -- vim.keymap.set('n', 'Y', api.fs.copy.relative_path, o(bufnr))
        -- Open
        -- vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, o(bufnr))
        -- CD
        -- vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, o(bufnr))
      end,
    }

    vim.keymap.set('n', '<', function()
      if view.is_visible() then
        view.close()
      end
    end, opt)

    vim.keymap.set('n', '>', function()
      if not view.is_visible() then
        lib.open()
        vim.cmd.wincmd 'p'
      end
    end, opt)
  end,
}
