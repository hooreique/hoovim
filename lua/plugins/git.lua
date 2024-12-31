return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '<Space>e', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end)

        map('n', '<Space>u', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end)

        map('n', '<Space>;', '<Nop>')

        -- Actions
        -- map('n', '<Space>hs', gitsigns.stage_hunk)
        map('n', '<Space>rh', gitsigns.reset_hunk)
        -- map('v', '<Space>hs', function()
        --   gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') }
        -- end)
        map('v', '<Space>rh', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end)
        -- map('n', '<Space>hS', gitsigns.stage_buffer)
        -- map('n', '<Space>hu', gitsigns.undo_stage_hunk)
        -- map('n', '<Space>hR', gitsigns.reset_buffer)
        map('n', '<Space>;p', gitsigns.preview_hunk)
        map('n', '<Space>;b', function()
          gitsigns.blame_line { full = true }
        end)
        map('n', '<Space>;;', gitsigns.toggle_current_line_blame)
        map('n', '<Space>;d', gitsigns.diffthis)
        map('n', '<Space>;s', function()
          gitsigns.diffthis '~'
        end)
        map('n', '<Space>;r', gitsigns.toggle_deleted)

        -- Text object
        -- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end,
    }
  end,
}
