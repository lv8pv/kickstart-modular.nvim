local opts = { noremap = true, silent = true }

-- Shorten function name

local keymap = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

return {
  -- Norwegian (possible more) keyboard layouts have the `}` and `{` at so
  -- useless places (we need to press AltGr + 7 and 0) That is very  award  for
  -- the fingers, specially if you have to do it often. And when you are
  -- jumping between paragraphs it is easier to have it bound to ctrl + , and .
  keymap('n', '<C-,>', '}', opts),
  keymap('n', '<C-.>', '{', opts),
  -- Hide search highlight by pressing enter
  -- This is set in `lua/keymaps.lua` and is set to <Esc>
  -- keymap("n", "<CR>", ":noh<CR><CR>"),
  -- Open my vim cheat_sheet
  -- -- NOTE: Change this to your own cheat_sheet file or comment it out
  keymap('n', '<leader>+', ':edit /home/lv8pv/doc/apps/nvim/cheat_sheet.txt<CR>', { desc = 'Open cheat_sheet.txt - Help for your nvim' }, opts),

  -- Dont know what this do yet...
  keymap('n', '<C-c>', 'dt', opts),

  -- gf will open filename under cursor or create it
  keymap('n', 'gf', ':edit <cfile><CR>', { desc = 'Open/Create file under cursor' }, opts),

  -- New empty Vertical split
  -- I think I will try to learn to just use :vnew and :vs before adding this again
  -- keymap("n", "<leader>n", ":vnew<CR>", opts),
  -- vertical splitt current buffer
  -- keymap("n", "<leader>v", ":vs<CR>",opts),
  --
  --
  -- BETTER WINDOW, BUFFER & TABS navigation
  -- -- WINDOWS
  -- -- Ctrl + (hjkl) Navigate between Windows
  keymap('n', '<C-h>', '<C-w>h', opts),
  keymap('n', '<C-j>', '<C-w>j', opts),
  keymap('n', '<C-k>', '<C-w>k', opts),
  keymap('n', '<C-l>', '<C-w>l', opts),
  --
  -- navigate tabs
  -- -- TABS
  -- -- Ctrl + Shift + (lh) Next and Previous Tab
  keymap('n', '<SC-l>', ':tabnext<CR>', opts),
  keymap('n', '<SC-h>', ':tabprevious<CR>', opts),

  -- BUFFERS
  -- Navigate buffers
  -- -- BUFFER
  -- -- Shift + (hl) Next and Previous buffer
  keymap('n', '<S-l>', ':bnext<CR>', opts), -- Also :bn
  keymap('n', '<S-h>', ':bprevious<CR>', opts), -- Also :bp
  keymap('n', ',', ':e#<CR>', opts), -- Previous buffer
  -- You can also use
  -- :buffers             -- List buffers
  -- :b#nr                -- Go to buffer with nr
  --
  -- Close buffer
  keymap('n', '<leader>bc', ':bd<CR>', opts),
  keymap('n', '<leader>bw', ':write<CR>', opts),
  -- keymap("n", "<leader>Q", ":bufdo bdelete<CR>", opts),-- Close all buffers

  -- Visual --
  -- Stay in indent mode
  keymap('v', '<', '<gv', opts),
  keymap('v', '>', '>gv', opts),

  -- Open and close nvim-tree
  keymap('n', '<leader>t', ':NvimTreeToggle<CR>', opts),

  keymap('n', '<leader>ff', 'ggVGgq', { desc = 'Format entire file using gq' }),

  -- Rebind halfscreen down so that it keeps cursoer in the middle of the screen
  keymap('n', '<C-d>', '<C-d>zz', { desc = 'Remap C-d so it keeps cursor in the middle of the window' }, opts),
  keymap('n', '<C-u>', '<C-u>zz', { desc = 'Remap C-u so it keeps cursor in the middle of the window' }, opts),

  -- A way to paste from yank registry with out losing it from the registry
  keymap('x', '<leader>p', '"_dP', { desc = 'Paste from register with out losing register' }, opts),

  -- Keep cursor where it is when joining lines behind
  keymap('n', 'J', 'mzJ`z', { desc = 'Keep cursor where it is when Joining lines' }, opts),

  -- Move text up and down
  -- Visual Block -- I like this better then Alt + J that mini.move use
  keymap('x', 'J', ":move '>+1<CR>gv-gv", opts, { desc = 'Move visual selected block Down' }, opts),
  keymap('x', 'K', ":move '<-2<CR>gv-gv", opts, { desc = 'Move visual selected block Up' }, opts),
  -- REMOVED AND REPLACED BY PLUGIN MINI.MOVE - Kept for future reference.
  -- keymap('v', '<A-j>', ':m .+1<CR>==', opts),
  -- keymap('v', '<A-k>', ':m .-2<CR>==', opts),
  -- keymap('v', 'p', '"_dP', opts),
  -- Move text up and down
  -- keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", opts),
  -- keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", opts),
}
--
-- vim: ts=2 sts=2 sw=2 et
