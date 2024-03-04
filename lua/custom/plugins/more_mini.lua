-- These are more mini plugins from `echasnovski/mini.nvim`
-- They are added here not to mix my added plugins with the original repo file
return {
  require('mini.tabline').setup(),
  --
  --
  -- Check out: https://github.com/echasnovski/mini.nvim
  -- Move visual selection in Visual mode. Defaults are Alt + hjkl.
  require('mini.move').setup(),
}
-- vim: ts=2 sts=2 sw=2 et
