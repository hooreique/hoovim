return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.icons').setup {}

      require('mini.git').setup {}

      require('mini.diff').setup {
        mappings = {
          apply = '',
          reset = '',
          textobject = '',
          goto_first = '',
          goto_prev = '',
          goto_next = '',
          goto_last = '',
        }
      }

      require('mini.comment').setup {
        mappings = {
          -- Toggle comment for both Normal and Visual modes
          comment = '',
          -- Toggle comment on current line
          comment_line = '/',
          -- Toggle comment on visual selection
          comment_visual = '/',
          -- Define 'comment' textobject
          -- Works also in Visual mode if mapping differs from `comment_visual`
          textobject = '/',
        }
      }

      require('mini.indentscope').setup {
        mappings = {
          -- Textobjects
          object_scope = '',
          object_scope_with_border = '',
          -- Motions (jump to respective border line; if not present - body line)
          goto_top = 'm',
          goto_bottom = 'M',
        },
        -- options = { indent_at_cursor = false },
      }

      require('mini.tabline').setup {}

      require('mini.statusline').setup {}
    end,
  },
}
