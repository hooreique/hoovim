return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies = 'williamboman/mason.nvim',
      },
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

      require('mason').setup {}
      require('mason-lspconfig').setup {}

      lsp.jdtls.setup { capabilities = cap }
      lsp.denols.setup { capabilities = cap }
      lsp.lua_ls.setup { capabilities = cap }
      lsp.nil_ls.setup { capabilities = cap }
    end,
  },
}
