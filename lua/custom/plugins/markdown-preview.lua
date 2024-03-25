-- https://github.com/iamcco/markdown-preview.nvim
-- Nice plug-in that let you preview your markdown files in a browser window
-- that synchronises with your nvim. To use it use :MarkdownPreview from the vim
-- command line. You can also make a keybinding to activate it.
return {
  'iamcco/markdown-preview.nvim',
  ft = 'markdown',
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  cmd = {
    'MarkdownPreviewToggle',
    'MarkdownPreview',
    'MarkdownPreviewStop',
  },
}
