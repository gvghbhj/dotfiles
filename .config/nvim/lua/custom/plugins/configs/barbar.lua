return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = false,
    autohide = true,
    icons = {
      buffer_index = true,
    },
    no_name_title = 'Empty: lol',
    minimum_padding = 3,
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
