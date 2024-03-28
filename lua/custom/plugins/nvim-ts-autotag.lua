-- https://github.com/windwp/nvim-ts-autotag
-- A plug-in that close your html tags when typing.
return {
  -- add nvim-ts-autotag to nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'windwp/nvim-ts-autotag' },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        autotag = {
          enable = true,
        },
      }
    end,
  },
}
