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

  '<Space>', '<Tab>', '<CR>', '<BS>', '<Delete>', '<Insert>',
  -- '<Esc>',
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

  { 't'    , 'a'     },
  { 'r'    , 'i'     },
  { 'T'    , 'R'     },
  { 'R'    , 'O'     },
  { '<CR>' , 'A<CR>' },
  { 'g'    , 'v'     },
  { 'G'    , 'V'     },

  { ';' , 'A;<ESC>'   },
  { '{' , 'A<Space>{' },

  { 'b' , 'gd' },
  { 'B' , 'gD' },

  { "'" , '/' },
  { '"' , '?' },
  { '=' , 'n' },
  { '-' , 'N' },

  { 'k' , [[:%s/\<<C-R><C-W>\>//g<Left><Left>]] },

  { '<Tab>' , '[{=%' },

  { 'z' , 'u'     },
  { 'Z' , '<C-R>' },

  { 'q' , 'qy' },
  { 'Q' , 'q'  },
  { 'p' , '@y' },

  { 'w'        , ':close<CR>'     },
  { 'W'        , ':only<CR>'      },
  { 'j'        , '<C-W>s'         },
  { 'J'        , '<C-W>w'         },
  { '<Space>=' , ':resize +3<CR>' },
  { '<Space>-' , ':resize -3<CR>' },
}

for _, map in ipairs(n_maps) do
  vim.keymap.set('n', map[1], map[2], o)
end

vim.notify('Not sure about hoomod? Type :q! to exit.', vim.log.levels.INFO)

require 'config.lazy'
