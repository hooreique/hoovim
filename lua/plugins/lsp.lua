--- @module 'lazy'
--- @type LazySpec
return {
  'neovim/nvim-lspconfig',
  dependencies = 'saghen/blink.cmp',
  config = function()
    if vim.fn.executable 'vue-language-server' == 1 then
      vim.lsp.config('vue_ls', {
        init_options = { vue = { hybridMode = false } },
        filetypes = {
          'javascript', 'javascriptreact', 'typescript', 'typescriptreact',
          'vue',
        },
      })
      vim.lsp.enable 'vue_ls'
    elseif vim.fn.executable 'typescript-language-server' == 1 then
      vim.lsp.config('ts_ls', {})
      vim.lsp.enable 'ts_ls'
    end

    for _, pair in ipairs {
      { 'denols',       'deno' },

      { 'ruff',         'ruff' },
      -- pkgs.basedpyright
      { 'basedpyright', 'basedpyright-langserver' },

      { 'nil_ls',       'nil' },

      { 'lua_ls',       'lua-language-server' },

      -- pkgs.vscode-langservers-extracted
      { 'jsonls',       'vscode-json-language-server' },

      -- pkgs.dockerfile-language-server-nodejs
      { 'dockerls',     'docker-langserver' },
    } do
      if vim.fn.executable(pair[2]) == 1 then
        vim.lsp.config(pair[1], {})
        vim.lsp.enable(pair[1])
      end
    end
  end,
}
