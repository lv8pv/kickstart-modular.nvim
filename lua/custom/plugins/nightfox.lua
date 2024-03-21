return {
  'EdenEast/nightfox.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Load the colorscheme here.
    -- This theme has many different styles: 'nightfox', 'dayfox', 'dawnfox',
    -- 'duskfox', 'nordfox', 'terafox' and 'carbonfox'
    vim.cmd 'syntax enable'
    vim.cmd.colorscheme 'nightfox'
  end,

  opts = {
    options = {
      dim_inactive = true, -- Non focused panes set to alternative background
      module_default = true, -- Default enable value for modules
      modules = {
        -- aerial = true,
        cmp = true,
        -- diagnostic = true,
        gitsigns = true,
        -- native_lsp = true,
        -- notify = true,
        -- symbol_outline = true,
        telescope = true,
        treesitter = true,
        whichkey = true,
      },
    },
    -- groups = { all = { NormalFloat = { link = "Normal" } } },
  },
}
