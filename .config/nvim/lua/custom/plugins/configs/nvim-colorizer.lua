return {
  'NvChad/nvim-colorizer.lua',
  event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
  opts = {
    user_default_options = {
      names = false,
      css = true,
      mode = 'both',
    },
  },
}
