-- https://github.com/szw/vim-maximizer
-- A nice little plugin that let you maximize any nvim window to a full term
-- size. Usefull when you have window splits and need the split window larger
--
-- Key binding <leader>mm to maximize and <leader>mm to go back again
-- Config:
-- Taken from https://github.com/saphorous/kickstart-modular.nvim and replaces
return {
  'szw/vim-maximizer',
  keys = {
    { '<leader>mm', '<cmd>MaximizerToggle<CR>', desc = 'Maximize/minimize a split' },
  },
}
-- vim: ts=2 sts=2 sw=2 et
