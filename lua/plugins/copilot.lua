---@param desc string
---@return vim.keymap.set.Opts
local function o(desc)
  return {
    noremap = true,
    nowait = true,
    desc = 'hoo: copilot: ' .. desc,
  }
end

return {
  'github/copilot.vim',
  config = function()
    vim.keymap.set('n', '<Space>c', '<Nop>', o 'Leading NOP')

    vim.keymap.set('n', '<Space>cs', function()
      vim.cmd 'Copilot setup'
    end, o 'Setup')

    vim.keymap.set('n', '<Space>cd', function()
      vim.cmd 'Copilot disable'
      vim.notify 'Copilot disabled'
    end, o 'Disable')

    vim.keymap.set('n', '<Space>ce', function()
      vim.cmd 'Copilot enable'
      vim.notify 'Copilot enabled'
    end, o 'Enable')
  end,
}
