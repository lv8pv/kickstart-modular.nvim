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
          native_lsp = { enabled = true },
          notify = true,
          telescope = true,
          nvimtree = true,
          treesitter = true,

          mini = {
            enabled = true,
            indentscope_color = '',
          },
        },
      }
      -- setup must be called before loading
      vim.cmd.colorscheme 'catppuccin-macchiato'

      -- I don't think this is needed now, but leave it here in case it is.
      -- for _, group in ipairs(vim.fn.getcompletion('@lsp', 'highlight')) do
      --   vim.api.nvim_set_hl(0, group, {})
      -- end
    end,
  },
}
