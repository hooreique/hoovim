return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    panel = {
      -- enable = false,
      keymap = {
        jump_prev = '<C-P>',
        jump_next = '<C-N>',
        accept = '<C-Y>',
        refresh = '<C-R>',
        open = '<C-CR>',
      },
    },
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = '<Tab>',
        next = '<C-E>',
        prev = '<C-U>',
        dismiss = '<C-BS>',
      },
    },
  },
}
