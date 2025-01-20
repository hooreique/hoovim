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
        config = function()
          if vim.fn.executable 'javac' == 1 and vim.fn.executable 'jdtls' == 1 then
            require('java').setup {}
          end
        end,
      },
    },
    config = function()
      local lsp = require 'lspconfig'
      local cap = require('blink.cmp').get_lsp_capabilities()

      -- nixpkgs#jdt-language-server
      if vim.fn.executable 'javac' == 1 and vim.fn.executable 'jdtls' == 1 then
        lsp.jdtls.setup { capabilities = cap }
      end

      if vim.fn.executable 'deno' == 1 then
        lsp.denols.setup { capabilities = cap }
      end

      if vim.fn.executable 'nil' == 1 then
        lsp.nil_ls.setup { capabilities = cap }
      end

      if vim.fn.executable 'lua-language-server' == 1 then
        lsp.lua_ls.setup { capabilities = cap }
      end

      -- nixpkgs#vscode-langservers-extracted
      if vim.fn.executable 'vscode-json-language-server' == 1 then
        lsp.jsonls.setup { capabilities = cap }
      end
    end,
  },
}
