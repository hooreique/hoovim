return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    local ui = require 'dapui'

    ---@diagnostic disable-next-line: missing-fields
    ui.setup {
      ---@diagnostic disable-next-line: missing-fields
      floating = {
        mappings = { close = { '<Esc>' } },
      },
      mappings = {
        edit = '<CR>',
        expand = { 't', '<2-LeftMouse>' },
        open = { 'a', 'b' },
        remove = { 'd', 'x' },
        repl = '<Space><Enter>',
        toggle = '<Tab>',
      },
    }

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end

    dap.adapters['pwa-node'] = {
      type = 'server',
      host = '127.0.0.1',
      port = '${port}',
      executable = {
        command = 'js-debug',
        args = { '${port}', '127.0.0.1' },
      },
    }
  end,
}
