---@param desc string
---@return vim.keymap.set.Opts
local function o(desc)
  return {
    noremap = true,
    nowait = true,
    desc = 'hoo: dap: ' .. desc,
  }
end

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

    -- nixpkgs#vscode-js-debug
    if vim.fn.executable 'js-debug' == 1 then
      dap.adapters['pwa-node'] = {
        type = 'server',
        host = '127.0.0.1',
        port = '${port}',
        executable = {
          command = 'js-debug',
          args = { '${port}', '127.0.0.1' },
        },
      }
    end

    vim.keymap.set('n', '<Space>d', '<Nop>', o 'Leading NOP')
    vim.keymap.set('n', '<Space>d<Space>', function()
      dap.toggle_breakpoint()
    end, o 'Toggle Breakpoint')
    vim.keymap.set('n', '<Space>dl', function()
      dap.list_breakpoints(true)
    end, o 'List Breakpoints')
    vim.keymap.set('n', '<Space>dc', function()
      dap.clear_breakpoints()
    end, o 'Clear Breakpoints')

    vim.keymap.set('n', '<Space>dd', function()
      dap.continue()
    end, o 'Continue ▶︎')
    vim.keymap.set('n', '<Space>de', function()
      dap.step_over()
    end, o 'Step Over ↓')
    vim.keymap.set('n', '<Space>du', function()
      dap.step_back()
    end, o 'Step Back ↑')
    vim.keymap.set('n', '<Space>di', function()
      dap.step_into()
    end, o 'Step Into →')
    vim.keymap.set('n', '<Space>dn', function()
      dap.step_out()
    end, o 'Step Out ←')

    vim.keymap.set('n', '<Space>dt', function()
      dap.terminate()
    end, o 'Terminate')
    vim.keymap.set('n', '<Space>dr', function()
      dap.restart()
    end, o 'Restart')
  end,
}
