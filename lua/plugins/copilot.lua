---@type vim.keymap.set.Opts
local o = { noremap = true, nowait = true }

return {
  'github/copilot.vim',
  config = function()
    vim.keymap.set('n', '<Space>c', '<Nop>', o)

    vim.keymap.set('n', '<Space>cs', function()
      vim.cmd 'Copilot setup'
    end, o)

    vim.keymap.set('n', '<Space>cd', function()
      vim.cmd 'Copilot disable'
      vim.notify 'Copilot disabled'
    end, o)

    vim.keymap.set('n', '<Space>ce', function()
      vim.cmd 'Copilot enable'
      vim.notify 'Copilot enabled'
    end, o)
  end,
}
