local remap = function(_, bufnr)
  local opts = {
    buffer = bufnr,
    noremap = true,
    nowait = true,
    silent = true,
  }

  vim.keymap.set('n', 'a',        vim.lsp.buf.references,    opts)
  vim.keymap.set('n', 'b',        vim.lsp.buf.definition,    opts)
  vim.keymap.set('n', 'B',        vim.lsp.buf.hover,         opts)
  vim.keymap.set('n', 'k',        vim.lsp.buf.rename,        opts)
  vim.keymap.set('n', '<Space>f', vim.lsp.buf.format,        opts)
  vim.keymap.set('n', '<Space>d', vim.diagnostic.open_float, opts)
end

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lsp = require 'lspconfig'
      local cap = require('blink.cmp').get_lsp_capabilities()

      lsp.denols.setup { on_attach = remap, capabilities = cap }
      lsp.lua_ls.setup { on_attach = remap, capabilities = cap }
      lsp.nil_ls.setup { on_attach = remap, capabilities = cap }
    end,
  },
}
