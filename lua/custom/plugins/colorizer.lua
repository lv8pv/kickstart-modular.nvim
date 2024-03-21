-- Let us see color in the buffer when working with css, html and javascript
-- files.
-- https://github.com/NvChad/nvim-colorizer.lua
return {
  { -- Useful plugin to show you pending keybinds.
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        filetypes = { 'css', 'html', 'javascript' },
        user_default_options = {
          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB,
          names = true,
          css = true,
          -- Enable all CSS *functions*: rgb_fn, hsl_fn
          css_fn = true,
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = 'background', -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = true, -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          virtualtext = '■',
          -- update color values even if buffer is not focused
          always_update = false,
        },
      }
    end,
  },
}
