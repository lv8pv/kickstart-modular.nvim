-- https://github.com/catppuccin/nvim
-- Nice colour scheme with a lot of options and integrations. This config is
-- based on a config by this YT user>
-- https://www.youtube.com/watch?v=oo_I5lAmdi0
--
-- This colour scheme have several flavors to chose from: `catppuccin-latte`,
-- `catppuccin-frappe`, `catppuccin-macchiato` and `catppuccin-mocha`
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
            enabled = true,
            scope_color = 'sapphire',
            colored_indent_levels = true,
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
      -- Flavors to chose from: `catppuccin-latte`, `catppuccin-frappe`,
      -- `catppuccin-macchiato` and `catppuccin-mocha`
      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },
}
