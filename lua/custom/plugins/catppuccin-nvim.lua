return {
  {
    'catppuccin/nvim',
    config = function()
      require('catppuccin').setup {
        integrations = {
          cmp = true,
          gitsigns = true,
          harpoon = true,
          indent_blankline = {
            enabled = false,
            scope_color = 'sapphire',
            colored_indent_levels = false,
          },
          mason = true,
          native_lsp = { enable = true },
          notify = true,
          telescope = true,
          nvimtree = true,
          treesitter = true,

          mini = {
            enabled = true,
            indentscope_color = '',
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      }

      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
}
