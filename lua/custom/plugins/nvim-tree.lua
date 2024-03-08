vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '',
    staged = 'S',
    unmerged = '',
    renamed = '➜',
    deleted = '',
    untracked = 'U',
    ignored = '◌',
  },
  folder = {
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
  },
}
return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('nvim-tree').setup {
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 50,
        side = 'left',
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
        custom = {},
      },
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,

      hijack_cursor = false,
      update_cwd = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = '',
          info = '',
          warning = '',
          error = '',
        },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 500,
      },
      trash = {
        cmd = 'trash',
        require_confirm = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },
    }
  end,
}
-- return {}
-- vim: ts=2 sts=2 sw=2 et
