vim.opt.autowrite = true
vim.opt.hidden = true
vim.opt.bufhidden = 'hide'
-- Default spell language
vim.opt.spelllang = 'en_gb'
-- Set spell default off
vim.opt.spell = false
-- Text width before wrapping
vim.opt.textwidth = 80
-- Sets a colour line at the text width position
vim.opt.colorcolumn = '80'
-- creates a backup file
vim.opt.backup = false
-- more space in the neovim command line for displaying messages
vim.opt.cmdheight = 2
-- so that `` is visible in markdown files
vim.opt.conceallevel = 0
-- the encoding written to a file
vim.opt.fileencoding = 'utf-8'
-- pop up menu height
vim.opt.pumheight = 10
-- always show tabs
vim.opt.showtabline = 2
-- make indenting smarter again
vim.opt.smartindent = true
-- creates a swap file
vim.opt.swapfile = false
-- set term gui colours (most terminals support this)
vim.opt.termguicolors = true
-- if a file is being edited by another program (or was written to file while
-- editing with another program) it is not allowed to be edited
vim.opt.writebackup = false
-- convert tabs to spaces
vim.opt.expandtab = true
-- the number of spaces inserted for each indentation
vim.opt.shiftwidth = 0
-- insert 4 spaces for a tab
vim.opt.tabstop = 4
-- set relative numbered lines
vim.opt.relativenumber = true
-- set number column width to 2 {default 4}
vim.opt.numberwidth = 4
-- display lines as one long line
vim.opt.wrap = false
-- the font used in graphical neovim applications
vim.opt.guifont = 'monospace:h17'
-- Change visual block mode to virtual edit mode
vim.opt.virtualedit = 'block'
-- Same as scrolloff but for the sides. Only useful when `nowrap`is set
vim.opt.sidescrolloff = 0

-- These are set in the main `lua/options.lua`
-- number = true,               -- set numbered lines
-- mouse = "a",                 -- allow the mouse to be used in neovim
-- showmode = false,            -- we don't need to see things like -- INSERT -- any more
-- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
-- breakindent = true,          -- when breaking for linewrap indent correctly as line before
-- undofile = true,             -- enable persistent undo
-- ignorecase = true,           -- ignore case in search patterns
-- smartcase = true,            -- smart case
-- signcolumn = "yes",          -- always show the sign column, otherwise it would shift the text each time
-- timeoutlen = 250,            -- time to wait for a mapped sequence to complete (in milliseconds)
-- updatetime = 300,            -- faster completion (4000ms default)
-- splitbelow = true,           -- force all horizontal splits to go below current window
-- splitright = true,           -- force all vertical splits to go to the right of current window
-- inccommand = 'split'         -- Preview substitutions live , as you type
-- cursorline = true,           -- highlight the current line
-- scrolloff = 10,              -- How many lines to keep the cursor away from the bottom of the screen
--
-- -- Show how to display  white spaces in the editor-
-- list = true,
-- listchars = { tab = '» ', trail = '·', nbsp = '␣' }
--
-- -- These are set in `lua/keymaps.lua` So we don't need it here.
-- hlsearch = true,             -- highlight all matches on previous search pattern
--
-- -- These are set in `lua/kickstart/plugin/cmp.lua`
-- completeopt = { "menu", "menuone", "noinsert" },
-- -- I had also "noselect" set but not sure what its fore. I leave it here in case for later use
-- completeopt = { "menuone", "noselect" }, -- mostly just for cmp

-- Not quite sure what these do. I have had them with me from my first nvim
-- config and keep them as they at least don't create any problems I notices
vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd 'set iskeyword+=-'
vim.cmd 'set formatoptions-=cro' -- TODO: this doesn't seem to work
vim.cmd [[ 
    autocmd BufWinLeave *.* mkview!
    autocmd BufWinenter *.* silent! loadview
]]
--
-- Change a few settings for filetype `markdown`
-- -- I reconsidered and came to the conclusion that I prefer 79 and 80 for
-- -- everything on my terminal. It is only for .md files that are going to
-- -- github I need 120 and 121. For those files I use `-- vim modline` in
-- -- the specific files I need it. I left the code in here commented out if
-- -- someone else need it
-- --
-- vim.cmd [[
--     autocmd FileType markdown set textwidth=120|set colorcolumn=121
-- ]]

-- Added so that `:help` files opens in a new full height buffer.
-- You can navigate between buffers using `shift + h|l` or `,` (in normal mode)
vim.cmd [[
    augroup help_as_buffer
      autocmd!
      autocmd FileType help :tabnew % | tabprevious | quit | tabnext
      autocmd FileType help set buflisted
    augroup END
]]

return {}

-- vim: ts=2 sts=2 sw=2 spell et
