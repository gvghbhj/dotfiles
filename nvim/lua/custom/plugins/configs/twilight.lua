return {
  'folke/twilight.nvim',
  event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
  opts = {
    context = 15, -- number of lines to show
  },
}
