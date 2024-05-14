return {
  'akinsho/bufferline.nvim',
  event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
  keys = {
    { '<Tab>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-tab>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<leader>x', '<cmd>bdelete<CR>', desc = 'close buffer' },
    { '<A-.>', '<cmd>BufferLineMoveNext<CR>', desc = 'move buffer to the right' },
    { '<A-,>', '<cmd>BufferLineMovePrev<CR>', desc = 'move buffer to the left' },
  },
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
      diagnostics_indicator = function(count, level)
        local icon = level:match 'error' and ' ' or ''
        return ' ' .. icon .. count
      end,
      numbers = function(opts)
        return string.format('%s: ', opts.ordinal)
      end,
      indicator = {
        icon = '',
        style = 'underline',
      },
    },
  },
}
