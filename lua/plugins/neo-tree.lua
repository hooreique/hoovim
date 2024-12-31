return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      sources = { 'filesystem' },
      use_default_mappings = false,
      window = {
        width = 30,
        mappings = {
          -- ['<space>'] = 'toggle_node',
          ['<2-LeftMouse>'] = 'open',
          ['<cr>'] = 'open',
          -- ['<cr>'] = { 'open', config = { expand_nested_files = true } }, -- expand nested file takes precedence
          -- ['<esc>'] = 'cancel', -- close preview or floating neo-tree window
          -- ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = false } },
          -- ['<C-f>'] = { 'scroll_preview', config = { direction = -10 } },
          -- ['<C-b>'] = { 'scroll_preview', config = { direction = 10 } },
          -- ['l'] = 'focus_preview',
          -- ['S'] = 'open_split',
          -- ['S'] = 'split_with_window_picker',
          -- ['s'] = 'open_vsplit',
          -- ['sr'] = 'open_rightbelow_vs',
          -- ['sl'] = 'open_leftabove_vs',
          -- ['s'] = 'vsplit_with_window_picker',
          -- ['t'] = 'open_tabnew',
          -- ['<cr>'] = 'open_drop',
          -- ['t'] = 'open_tab_drop',
          -- ['w'] = 'open_with_window_picker',
          ['t'] = 'open',
          ['r'] = 'close_node',
          ['-'] = 'close_all_nodes',
          ['+'] = 'expand_all_nodes',
          ['R'] = 'refresh',
          ['q'] = 'close_window',
          ['?'] = 'show_help',
        },
      },
      filesystem = {
        group_empty_dirs = true,
        hijack_netrw_behavior = 'disabled',
        window = {
          mappings = {
            ["."] = "toggle_hidden",
            -- ["/"] = "fuzzy_finder",
            -- ["D"] = "fuzzy_finder_directory",
            -- ["/"] = "filter_as_you_type", -- this was the default until v1.28
            -- ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
            -- ["D"] = "fuzzy_sorter_directory",
            -- ["f"] = "filter_on_submit",
            -- ["<C-x>"] = "clear_filter",
            ["<Left>"] = "navigate_up",
            ["<C-R>"] = "set_root",
            -- ["[g"] = "prev_git_modified",
            -- ["]g"] = "next_git_modified",
            ["d"] = "show_file_details",
            -- ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
            -- ["oc"] = { "order_by_created", nowait = false },
            -- ["od"] = { "order_by_diagnostics", nowait = false },
            -- ["og"] = { "order_by_git_status", nowait = false },
            -- ["om"] = { "order_by_modified", nowait = false },
            -- ["on"] = { "order_by_name", nowait = false },
            -- ["os"] = { "order_by_size", nowait = false },
            -- ["ot"] = { "order_by_type", nowait = false },
          },
        },
      },
    }

    vim.keymap.set('n', '`', ':Neotree toggle<CR>', {
      noremap = true,
      nowait = true,
      desc = 'hoo: neo-tree: Toggle',
    })
  end,
}
