return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'catppuccin',
      -- section_separators = { left = '', right = '' },
      -- component_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      -- component_separators = { left = ')', right = '(' },
      -- section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = { 'oil' },
        winbar = {},
      },
      ignore_focus = { 'minifiles', 'TelescopePrompt' },
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          path = 1,
          symbols = {
            starter = 'Neovim - The most based text editor',
            readonly = '',
          },
        },
      },
      lualine_x = { 'filetype' },
      lualine_y = { 'filesize' },
      lualine_z = { 'location', 'selectioncount', 'searchcount' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
