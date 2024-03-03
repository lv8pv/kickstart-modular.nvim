local options = {
  autowrite = true,
  hidden = true,
  bufhidden = 'hide',
  spelllang = 'en_gb', -- Default spell language
  spell = false, -- Set spell off
  colorcolumn = '80', -- Colour line at the text width position
  textwidth = 79, -- Text width before wrapping
  backup = false, -- creates a backup file
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = 'utf-8', -- the encoding written to a file
  pumheight = 10, -- pop up menu height
  showtabline = 2, -- always show tabs
  smartindent = true, -- make indenting smarter again
  swapfile = false, -- creates a swap file
  termguicolors = true, -- set term gui colors (most terminals support this)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 0, -- the number of spaces inserted for each indentation
  tabstop = 4, -- insert 4 spaces for a tab
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  wrap = false, -- display lines as one long line
  guifont = 'monospace:h17', -- the font used in graphical neovim applications
  virtualedit = 'block', -- Change visual block mode to virtual edit mode
  sidescrolloff = 0, -- Same as scrolloff but for the sides. Only usefull when `nowrap`is set

  -- These are set in the main `lua/options.lua`
  -- number = true,                           -- set numbered lines
  -- mouse = "a",                             -- allow the mouse to be used in neovim
  -- showmode = false,                        -- we don't need to see things like -- INSERT -- any more
  -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  -- breakindent = true,                      -- when breaking for linewrap indent corectly as line before
  -- undofile = true,                         -- enable persistent undo
  -- ignorecase = true,                       -- ignore case in search patterns
  -- smartcase = true,                        -- smart case
  -- signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  -- timeoutlen = 250,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  -- updatetime = 300,                        -- faster completion (4000ms default)
  -- splitbelow = true,                       -- force all horizontal splits to go below current window
  -- splitright = true,                       -- force all vertical splits to go to the right of current window
  --
  -- Not sure I want this. Usually I think the editor looks messy with it but
  -- for now I leave it in
  -- list = true,                             -- Show how to display  white spaces in the editor
  -- listchars = { tab = '» ', trail = '·', nbsp = '␣' }
  --
  --
  -- inccommand = 'split'                     -- Preview substitutions live , as you type
  -- cursorline = true,                       -- highlight the current line
  -- scrolloff = 10,                          -- How many lines to keep the cursor away from the bottom of the screen
  --
  -- These are set in `lua/keymaps.lua` So we don't need it here.
  -- hlsearch = true,                         -- highlight all matches on previous search pattern
  --
  -- These are set in `lua/kickstart/plugin/cmp.lua`
  -- completeopt = { "menu", "menuone", "noinsert" },
  -- I had also "noselect" set but not sure what its fore. I leave it here in
  -- case for later use
  -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
}

vim.opt.shortmess:append 'c'

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd 'set iskeyword+=-'
vim.cmd 'set formatoptions-=cro' -- TODO: this doesn't seem to work
vim.cmd [[ 
  autocmd BufWinLeave *.* mkview!
  autocmd BufWinenter *.* silent! loadview
]]
--
-- Change a few settings for filetype `markdown`
vim.cmd [[
  autocmd FileType markdown set textwidth=120|set colorcolumn=121
]]

return {}
