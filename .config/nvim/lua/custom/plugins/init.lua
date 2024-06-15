return {

  -- Formerly, used to use bufferline, but i now switch buffers via telescope builtin.buffers, if you want you can re-enable bufferline by uncommenting the following line
  -- require 'custom.plugins.configs.bufferline',

  -- Formerly used to use Alpha as Dashboard, now use mini.starter
  -- require 'custom.plugins.configs.alpha',

  -- require 'custom.plugins.configs.twilight',

  -- Colorscheme: catppuccin
  require 'custom.plugins.configs.catppuccin',

  -- statusline
  require 'custom.plugins.configs.lualine',

  -- for better formatting
  require 'custom.plugins.configs.indent-blankline',

  require 'custom.plugins.configs.markdown-preview',

  -- Colorsises colors and hex codes like '#7287fd'
  require 'custom.plugins.configs.nvim-colorizer',
}
