vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 250
vim.opt.hlsearch = false
vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

local modes = {'n', 'v', 'o'}

local keys = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
  'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',

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
  -- '<CR>', '<Esc>',
}

local o = { noremap = true, nowait = true, silent = true }

for _, key in ipairs(keys) do
  vim.keymap.set(modes, key, '<Nop>', o)
end

local nv_maps = {
  { '<Up>'    , 'gk' },
  { '<Down>'  , 'gj' },
  { '<Left>'  , 'h'  },
  { '<Right>' , 'l'  },

  { 'u' , 'gk'                           },
  { 'e' , 'gj'                           },
  { 'n' , 'h'                            },
  { 'i' , 'l'                            },
  { 'U' , [[?\S\s*\n\s*\n<CR>0]]         },
  { 'E' , [[/\S\s*\n\s*\n<CR>/\S<CR>k0]] },
  { 'N' , 'ge'                           },
  { 'I' , 'w'                            },

  { '<Home>' , 'g0' },
  { '<End>'  , 'g$' },

  { 'h' , 'g0'  },
  { 'o' , 'g$'  },
  { 'H' , 'gg0' },
  { 'O' , 'G$'  },

  { 'y' , '``' },

  { 'f' , '3<C-Y>' },
  { 's' , '3<C-E>' },
  { 'F' , '<C-U>'  },
  { 'S' , '<C-D>'  },

  { '<Space><Space>' , 'zz' },

  { 'c' , '"zy' },
  { 'v' , '"zp' },
  { 'C' , '"+y' },
  { 'V' , '"+p' },

  { 'x' , 'x' },
}

for _, map in ipairs(nv_maps) do
  vim.keymap.set({'n', 'v'}, map[1], map[2], o)
end

local v_maps = {
  { 'd' , '"zd' },
  { 'D' , '"+d' },

  { '<BS>'  , 'd' },
  { '<Del>' , 'd' },
}

for _, map in ipairs(v_maps) do
  vim.keymap.set('v', map[1], map[2], o)
end

local n_maps = {
  { 'd' , '"zdd' },
  { 'D' , '"+dd' },

  { '<BS>'  , 'dhi' },
  { '<Del>' , 'xi'  },

  { 't'           , 'a' },
  { 'r'           , 'i' },
  { 'T'           , 'R' },
  { '<Space><CR>' , 'o' },
  { 'R'           , 'O' },
  { 'g'           , 'v' },
  { 'G'           , 'V' },

  { ';' , 'A;<ESC>'   },
  { '{' , 'A<Space>{' },

  { 'b' , 'gd' },
  { 'B' , 'gD' },

  { '<Space>u' , ':cprevious<CR>' },
  { '<Space>e' , ':cnext<CR>' },

  { "'" , '/' },
  { '"' , '?' },
  { '=' , 'n' },
  { '-' , 'N' },

  { 'k' , [[:%s/\<<C-R><C-W>\>//g<Left><Left>]] },

  { 'z' , 'u'     },
  { 'Z' , '<C-R>' },

  { 'q' , 'qy' },
  { 'Q' , 'q'  },
  { 'p' , '@y' },

  { '<Space>s'     , ':write<CR>' },
  { '<Space>q<CR>' , ':quit<CR>'  },
  { '<Space>qa'    , ':qa<CR>'    },
  { '<Space>qw'    , ':wq<CR>'    },
  { '<Space>qq'    , ':q!<CR>'    },
  { '<Space>rr'    , ':e!<CR>'    },

  { 'w'        , ':close<CR>'         },
  { 'W'        , ':only<CR>'          },
  { 'j'        , ':wincmd s<CR>'      },
  { 'J'        , ':wincmd v<CR>'      },
  { '<Space>j' , ':wincmd w<CR>'      },
  { '<Space>J' , ':wincmd W<CR>'      },
  { '<Space>=' , ':wincmd 3+<CR>'     },
  { '<Space>-' , ':wincmd 3-<CR>'     },
  { '<Space>+' , ':wincmd 10><CR>'    },
  { '<Space>_' , ':wincmd 10<LT><CR>' },

  { '<Space>T' , '<C-W>T' }, -- curr split -> new tab

  { '<Space>t' , ':tabnew<CR>'      },
  { '<Space>w' , ':tabonly<CR>'     },
  { '<Space>i' , ':tabnext<CR>'     },
  { '<Space>n' , ':tabprevious<CR>' },
  { '<Space>h' , ':tabfirst<CR>'    },
  { '<Space>o' , ':tablast<CR>'     },
  { '<Space>1' , ':1tabnext<CR>'    },
  { '<Space>2' , ':2tabnext<CR>'    },
  { '<Space>3' , ':3tabnext<CR>'    },
  { '<Space>4' , ':4tabnext<CR>'    },
  { '<Space>5' , ':5tabnext<CR>'    },
  { '<Space>6' , ':6tabnext<CR>'    },
  { '<Space>7' , ':7tabnext<CR>'    },
  { '<Space>8' , ':8tabnext<CR>'    },
  { '<Space>9' , ':9tabnext<CR>'    },
  { '<Space>0' , ':0tabnext<CR>'    },
}

for _, map in ipairs(n_maps) do
  vim.keymap.set('n', map[1], map[2], o)
end

vim.notify('Not sure about hoomod? Type :q! to exit.', vim.log.levels.INFO)

-- 터미널 창 구성
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.api.nvim_set_option_value('number', false, { scope = 'local' })
    vim.api.nvim_set_option_value('spell', false, { scope = 'local' })
  end,
})

-- 하단에 새 터미널 창 열기
vim.keymap.set('n', '<Space>p', function()
  vim.cmd 'botright terminal'
  vim.api.nvim_win_set_height(0, 5)
end)

-- 터미널 모드에서 나오기
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-N>', o)

require 'config.lazy'
