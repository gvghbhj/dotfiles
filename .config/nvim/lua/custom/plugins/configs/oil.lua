return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
      'permissions',
      'size',
      -- "mtime",
    },
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ['?'] = 'actions.show_help',
      ['<S-q>'] = 'actions.close',
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
