return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    panel = {
      enable = false,
      keymap = {
        jump_prev = '<C-\\>c',
        jump_next = '<C-\\>c',
        accept = '<C-\\>c',
        refresh = '<C-\\>c',
        open = '<C-\\>c',
      },
    },
    suggestion = {
      auto_trigger = true,
      keymap = {
        accept = '<Tab>',
        next = '<C-\\>c',
        prev = '<C-\\>c',
        dismiss = '<C-\\>c',
      },
    },
  },
}
