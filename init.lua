vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.scrolloff = 3
vim.opt.updatetime = 250
vim.opt.spell = true
vim.opt.spelllang = { 'en_us', 'cjk' }

local keys = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
  'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
  -- 'm',

  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',

  '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '+',
  '=', '[', ']', '{', '}', '|', '\\', ';', "'", '"', ',',
  '<', '>', '/', '?', '`', '~',
  -- '.', ':',

  '<F1>', '<F2>', '<F3>', '<F4>', '<F5>', '<F6>', '<F7>', '<F8>',
  '<F9>', '<F10>', '<F11>', '<F12>',

  '<Up>', '<Down>', '<Left>', '<Right>',
  '<Home>', '<End>', '<PageUp>', '<PageDown>',

  '<Space>', '<Tab>', '<BS>', '<Delete>', '<Insert>',
  -- '<CR>', '<ESC>',
}

---@type vim.keymap.set.Opts
local o = { noremap = true, nowait = true }

for _, key in ipairs(keys) do
  vim.keymap.set({ 'n', 'v', 'o' }, key, '<Nop>', o)
end

local nv_maps = {
  { '<Up>',           'k' },
  { '<Down>',         'j' },
  { '<Left>',         'h' },
  { '<Right>',        'l' },

  { 'u',              'gk' },
  { 'e',              'gj' },
  { 'n',              'h' },
  { 'i',              'l' },
  { 'U',              '{' },
  { 'E',              '}' },
  { 'N',              'ge' },
  { 'I',              'w' },

  { '<Home>',         '0' },
  { '<End>',          '$' },

  { 'h',              'g0' },
  { 'o',              'g$' },
  { 'H',              'gg0' },
  { 'O',              'G$' },

  { 'y',              '<C-O>' },
  { 'Y',              '<C-I>' },

  { 'f',              '3<C-Y>' },
  { 's',              '3<C-E>' },
  { 'F',              '<C-U>' },
  { 'S',              '<C-D>' },

  { '<PageUp>',       '<C-B>' },
  { '<PageDown>',     '<C-F>' },

  { '<Space><Space>', 'zz' },

  { 'v',              '"zp' },
  { 'V',              '"+p' },

  { 'x',              'x' },
}

for _, map in ipairs(nv_maps) do
  vim.keymap.set({ 'n', 'v' }, map[1], map[2], o)
end

local v_maps = {
  { 'C',     '"+y' },
  { 'c',     '"zy' },
  { 'd',     '"zd' },
  { 'D',     '"+d' },

  { '<BS>',  'd' },
  { '<Del>', 'd' },
}

for _, map in ipairs(v_maps) do
  vim.keymap.set('v', map[1], map[2], o)
end

local n_maps = {
  { '<Space>m',     '`' },

  { 'C',            '"+yy' },
  { 'c',            '"zyy' },
  { 'd',            '"zdd' },
  { 'D',            '"+dd' },

  { '<BS>',         'dhi' },
  { '<Del>',        'xi' },

  { 't',            'a' },
  { 'r',            'i' },
  { 'T',            'R' },
  { '<Space><CR>',  'o' },
  { 'R',            'O' },
  { 'g',            'v' },
  { 'G',            'V' },

  { ';',            'A;<ESC>' },
  { '{',            'A<Space>{' },

  { '<',            ':cprevious<CR>' },
  { '>',            ':cnext<CR>' },

  { "'",            '/' },
  { '"',            '?' },
  { '=',            'n' },
  { '-',            'N' },

  { 'z',            'u' },
  { 'Z',            '<C-R>' },

  { 'q',            'qy' },
  { 'Q',            'q' },
  { 'p',            '@y' },

  { '<Space>s',     ':write<CR>' },
  { '<Space>q',     '<Nop>' },
  { '<Space>q<CR>', ':quit<CR>' },
  { '<Space>qa',    ':qa<CR>' },
  { '<Space>qw',    ':wq<CR>' },
  { '<Space>qq',    ':quit!<CR>' },
  { '<Space>r',     '<Nop>' },
  { '<Space>rr',    ':edit!<CR>' },

  { 'w',            ':close<CR>' },
  { 'W',            ':only<CR>' },
  { 'j',            ':wincmd s<CR>' },
  { 'J',            ':wincmd v<CR>' },
  { '<Space>j',     ':wincmd w<CR>' },
  { '<Space>J',     ':wincmd W<CR>' },
  { '<Space>=',     ':wincmd 3+<CR>' },
  { '<Space>-',     ':wincmd 3-<CR>' },
  { '<Space>+',     ':wincmd 10><CR>' },
  { '<Space>_',     ':wincmd 10<LT><CR>' },

  { '<Space>T',     '<C-W>T' }, -- curr split -> new tab

  { '<Space>t',     '<Nop>' },
  { '<Space>tt',    ':tabnew .<CR>' },
  { '<Space>tw',    ':tabonly<CR>' },
  { '<Space>ti',    ':tabnext<CR>' },
  { '<Space>tn',    ':tabprevious<CR>' },
  { '<Space>th',    ':tabfirst<CR>' },
  { '<Space>to',    ':tablast<CR>' },
  { '<Space>t1',    ':1tabnext<CR>' },
  { '<Space>t2',    ':2tabnext<CR>' },
  { '<Space>t3',    ':3tabnext<CR>' },
  { '<Space>t4',    ':4tabnext<CR>' },
  { '<Space>t5',    ':5tabnext<CR>' },
  { '<Space>t6',    ':6tabnext<CR>' },
  { '<Space>t7',    ':7tabnext<CR>' },
  { '<Space>t8',    ':8tabnext<CR>' },
  { '<Space>t9',    ':9tabnext<CR>' },
  { '<Space>t0',    ':0tabnext<CR>' },

  { '<Space>w',     ':bdelete<CR>' },
  { '<Space>i',     ':bnext<CR>' },
  { '<Space>n',     ':bprevious<CR>' },
  { '<Space>h',     ':bfirst<CR>' },
  { '<Space>o',     ':blast<CR>' },
  { '<Space>1',     ':bfirst<CR>' },
  { '<Space>2',     ':bfirst | 1bnext<CR>' },
  { '<Space>3',     ':bfirst | 2bnext<CR>' },
  { '<Space>4',     ':bfirst | 3bnext<CR>' },
  { '<Space>5',     ':bfirst | 4bnext<CR>' },
  { '<Space>6',     ':bfirst | 5bnext<CR>' },
  { '<Space>7',     ':bfirst | 6bnext<CR>' },
  { '<Space>8',     ':bfirst | 7bnext<CR>' },
  { '<Space>9',     ':bfirst | 8bnext<CR>' },
  { '<Space>0',     ':bfirst | 9bnext<CR>' },
}

for _, map in ipairs(n_maps) do
  vim.keymap.set('n', map[1], map[2], o)
end

vim.notify('Not sure about hoomod? Type :q! to exit.', vim.log.levels.INFO)

-- 현재 버퍼 빼고 전부 지우기
vim.keymap.set('n', '<Space>W', function()
  local cur = vim.api.nvim_get_current_buf()
  local del = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= cur and vim.api.nvim_buf_is_loaded(buf) then
      vim.cmd.bdelete(buf)
      del = true
    end
  end
  if del then
    vim.api.nvim__redraw { tabline = true }
  end
end, o)

vim.keymap.set('n', 'a', vim.lsp.buf.references, o)
vim.keymap.set('n', 'b', vim.lsp.buf.definition, o)
vim.keymap.set('n', 'k', vim.lsp.buf.rename, o)
vim.keymap.set('n', '<Space>f', vim.lsp.buf.format, o)
vim.keymap.set('n', ',,', vim.lsp.buf.hover, o)
vim.keymap.set('n', ',d', vim.diagnostic.open_float, o)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.api.nvim_set_option_value('spell', false, { scope = 'local' })
  end,
})

-- 터미널 창 구성
vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.api.nvim_set_option_value('number', false, { scope = 'local' })
    vim.api.nvim_set_option_value('spell', false, { scope = 'local' })
  end,
})

vim.keymap.set('n', '<Space>p', '<Nop>', o)

-- 현재 창에서 터미널 열기
vim.keymap.set('n', '<Space>p<CR>', ':terminal<CR>i', o)

-- 새 탭에서 터미널 열기
vim.keymap.set('n', '<Space>pn', ':tabnew | terminal<CR>i', o)

-- 하단에 새 터미널 창 열기
vim.keymap.set('n', '<Space>pp', function()
  vim.cmd 'botright terminal'
  vim.api.nvim_win_set_height(0, 7)
  vim.api.nvim_command 'startinsert'
end, o)

-- Lazygit
vim.keymap.set('n', '<Space>pl', function()
  vim.cmd 'tabnew'
  vim.cmd 'terminal'
  vim.api.nvim_command 'startinsert'
  vim.api.nvim_input 'nix-shell -p lazygit --run lazygit'
end, o)

-- 터미널 모드에서 나오기
vim.keymap.set('t', '<C-\\><C-\\>', '<C-\\><C-N>', o)

-- 파일 브라우징
vim.keymap.set('n', '<Space>.', function()
  if vim.api.nvim_buf_get_name(0) == '' then
    vim.cmd.edit '.'
  else
    vim.cmd.edit '%:h'
  end
end, o)

require 'config.lazy'
