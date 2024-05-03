return {
  'iamcco/markdown-preview.nvim',
  event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
}
