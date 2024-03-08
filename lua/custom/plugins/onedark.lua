-- Nice colorcheme team  from:
-- https://github.com/navarasu/onedark.nvim
-- Config:
-- Taken from https://github.com/saphorous/kickstart-modular.nvim and replaces
return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('onedark').setup {
      -- Set a style preset. 'dark' is default.
      style = 'darker', -- dark, darker, cool, deep, warm, warmer, light
    }
    require('onedark').load()
  end,
}
-- vim: ts=2 sts=2 sw=2 et
