local remap = function(_, bufnr)
  local opts = {
    buffer = bufnr,
    noremap = true,
    nowait = true,
    silent = true,
  }

  vim.keymap.set('n', 'b', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'B', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'k', vim.lsp.buf.rename, opts)
end

return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp = require 'lspconfig'

      lsp.lua_ls.setup { on_attach = remap }
      lsp.denols.setup { on_attach = remap }
    end,
  },
}
