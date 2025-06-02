local function root()
  local cwd = vim.uv.cwd()
  local dir = cwd

  while dir do
    for _, marker in ipairs {
      'gradlew', 'mvnw', '.metadata', '.idea', '.vscode',
    } do
      local marker_path = dir .. '/' .. marker
      if vim.uv.fs_stat(marker_path) then
        return dir
      end
    end

    local parent = vim.uv.fs_realpath(dir .. '/..')
    if parent == dir then
      break
    end
    dir = parent
  end

  return cwd
end

--- @module 'lazy'
--- @type LazySpec
return {
  'mfussenegger/nvim-jdtls',
  enabled = function()
    -- pkgs.jdk  pkgs.jdt-language-server
    if vim.fn.executable 'javac' == 1 and vim.fn.executable 'jdtls' == 1 then
      local out = vim.system({ 'javac', '-version' }, { text = true }):wait()

      if out.stdout and out.stdout:find('^javac 21%.') then
        return true
      else
        vim.notify '`javac -version` does not start with `javac 21.`'
        return false
      end
    else
      return false
    end
  end,
  config = function()
    local datadir = root() .. '/.metadata/nvim-jdtls'

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = function()
        require('jdtls').start_or_attach { cmd = { 'jdtls', '-data', datadir } }
      end,
    })
  end,
}
