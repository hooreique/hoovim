return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        ---@param desc string
        ---@return vim.keymap.set.Opts
        local function o(desc)
          return {
            buffer = bufnr,
            noremap = true,
            nowait = true,
            desc = 'hoo: gitsigns: ' .. desc,
          }
        end

        vim.keymap.set('n', '<Space>e', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, o 'Next Hunk')

        vim.keymap.set('n', '<Space>u', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, o 'Prev Hunk')

        vim.keymap.set('n', '<Space>;', '<Nop>', o 'Leading NOP')

        vim.keymap.set('n', '<Space>rh', gitsigns.reset_hunk, o 'Reset Hunk')
        vim.keymap.set('v', '<Space>rh', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, o 'Reset Hunk Range')
        vim.keymap.set('n', '<Space>;p', gitsigns.preview_hunk, o 'Preview Hunk')
        vim.keymap.set('n', '<Space>;b', function()
          gitsigns.blame_line { full = true }
        end, o 'Blame')
        vim.keymap.set('n', '<Space>;;', gitsigns.toggle_current_line_blame,
          o 'Toggle Line Blame')
        vim.keymap.set('n', '<Space>;d', gitsigns.diffthis, o 'Diff with Index')
        vim.keymap.set('n', '<Space>;s', function()
          gitsigns.diffthis '~'
        end, o 'Diff with HEAD')
        vim.keymap.set('n', '<Space>;r', gitsigns.toggle_deleted,
          o 'Toggle Show Deleted')
      end,
    }
  end,
}
