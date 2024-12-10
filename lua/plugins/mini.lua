return {
  {
    'echasnovski/mini.nvim',
    config = function()
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

      require('mini.git').setup {}

      require('mini.icons').setup {}

      require('mini.statusline').setup {}

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

      require('mini.pairs').setup {}

      require('mini.completion').setup {
        mappings = {
          -- Force two-step completion
          force_twostep = '',
          -- Force fallback completion
          force_fallback = '',
        }
      }
    end,
  },
}
