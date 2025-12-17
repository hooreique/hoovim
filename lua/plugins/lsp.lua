-- See https://github.com/neovim/neovim/issues/30908#issuecomment-2657220629
local function denols_workaround()
  vim.api.nvim_create_autocmd({ 'BufReadCmd' }, {
    pattern = { 'deno:/*' },
    callback = function(params)
      local bufnr = params.buf
      local actual_path = params.match:sub(1)

      local clients = vim.lsp.get_clients({ name = 'denols' })
      if #clients == 0 then
        return
      end

      local client = clients[1]
      local method = 'deno/virtualTextDocument'
      local req_params = { textDocument = { uri = actual_path } }
      local response = client:request_sync(method, req_params, 2000, 0)
      if not response or type(response.result) ~= 'string' then
        return
      end

      local lines = vim.split(response.result, '\n')
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
      vim.api.nvim_set_option_value('readonly', true, { buf = bufnr })
      vim.api.nvim_set_option_value('modified', false, { buf = bufnr })
      vim.api.nvim_set_option_value('modifiable', false, { buf = bufnr })
      vim.api.nvim_buf_set_name(bufnr, actual_path)
      vim.lsp.buf_attach_client(bufnr, client.id)

      local filetype = 'typescript'
      if actual_path:sub(-3) == '.md' then
        filetype = 'markdown'
      end
      vim.api.nvim_set_option_value('filetype', filetype, { buf = bufnr })
    end,
  })
end

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

    if vim.fn.executable 'deno' == 1 and
        vim.fn.executable 'typescript-language-server' == 0 then
      vim.lsp.config('denols', {})
      vim.lsp.enable 'denols'
    end

    -- pkgs.svelte-language-server
    if vim.fn.executable 'svelteserver' == 1 then
      if vim.fn.executable 'typescript-language-server' == 1 then
        vim.lsp.enable 'ts_ls'
        vim.lsp.config('svelte', {})
        vim.lsp.enable 'svelte'
      else
        vim.notify 'svelteserver is executable but typescript-language-server is not.'
      end
    end

    -- pkgs.basedpyright
    if vim.fn.executable 'basedpyright-langserver' == 1 then
      vim.lsp.config('basedpyright', { offset_encoding = 'utf-8' })
      vim.lsp.enable('basedpyright')
    end

    for _, pair in ipairs {
      { 'ruff',        'ruff' },

      { 'nil_ls',      'nil' },

      { 'lua_ls',      'lua-language-server' },

      -- pkgs.vscode-langservers-extracted
      { 'html',        'vscode-html-language-server' },
      { 'cssls',       'vscode-css-language-server' },
      { 'jsonls',      'vscode-json-language-server' },

      { 'yamlls',      'yaml-language-server' },

      -- pkgs.dockerfile-language-server-nodejs
      { 'dockerls',    'docker-langserver' },

      { 'tailwindcss', 'tailwindcss-language-server' },

      { 'unocss',      'unocss-language-server' },
    } do
      if vim.fn.executable(pair[2]) == 1 then
        vim.lsp.config(pair[1], {})
        vim.lsp.enable(pair[1])
      end
    end

    denols_workaround()
  end,
}
