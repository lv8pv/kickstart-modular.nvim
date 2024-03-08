-- Taken from https://github.com/saphorous/kickstart-modular.nvim and replaces
-- the kickstart/plugins/treesitter.lua
return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require 'nvim-treesitter.configs'

    -- configure treesitter
    treesitter.setup {
      -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
      modules = {},

      -- enable syntax highlighting
      highlight = { enable = true },

      -- List of parsers to ignore installing
      ignore_install = {},

      -- enable indentation
      indent = { enable = true },

      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = false,

      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = { enable = true },

      -- Install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- ensure these language parsers are installed
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'gitignore',
        'go',
        'graphql',
        'html',
        'java',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'tsx',
        'vim',
        'vimdoc',
        'yaml',
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    }

    -- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
    -- This is not working, not sure why yet -- lv8pv
    -- require('ts_context_commentstring').setup {}
  end,
}
-- vim: ts=2 sts=2 sw=2 et
