--- @param desc string
--- @return vim.keymap.set.Opts
local function o(desc)
  return {
    noremap = true,
    nowait = true,
    desc = 'hoo: copilot: ' .. desc,
  }
end

--- @module 'lazy'
--- @type LazySpec
return {
  'zbirenbaum/copilot.lua',
  config = function()
    local copilot = require 'copilot'

    -- Rate Limit 도달하면 귀찮게 해서 별도로 활성화
    vim.keymap.set('n', '<Space>c', function()
      if copilot.setup_done then
        vim.notify ':Copilot enable'
        vim.cmd 'Copilot enable'
        return
      end

      vim.notify 'Setup Copilot...'

      copilot.setup {
        -- 별도의 Window 에서 제안을 봄
        panel = {
          -- 그닥일 거 같아서 끔
          enable = false,
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
      }
    end, o 'Enable')

    vim.keymap.set('n', '<Space>C', function()
      if not copilot.setup_done then
        vim.notify '아직 Copilot 이 Setup 되지 않았습니다.'
        return
      end

      vim.notify ':Copilot disable'
      vim.cmd 'Copilot disable'
    end, o 'Disable')
  end,
}
