return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim', opts = {} },
        opts = {},
      },
      {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          }
        },
      },
      {
        'saghen/blink.cmp',
        opts = {
          sources = {
            -- add lazydev to your completion providers
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
              lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
              },
            },
          },
        },
      },
      {
        'nvim-java/nvim-java',
        ft = 'java',
        opts = {},
      },
    },
    config = function()
      local lsp = require 'lspconfig'
      local cap = require('blink.cmp').get_lsp_capabilities()

      lsp.jdtls.setup { capabilities = cap }
      lsp.denols.setup { capabilities = cap }
      lsp.lua_ls.setup { capabilities = cap }
      lsp.jsonls.setup { capabilities = cap }
      lsp.nil_ls.setup { capabilities = cap }
    end,
  },
}
