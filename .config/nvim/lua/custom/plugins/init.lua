local plugins = {

  -- Formerly, used to use bufferline, but i now switch buffers via telescope builtin.buffers, if you want you can re-enable bufferline by uncommenting the following line
  -- require 'custom.plugins.configs.bufferline',

  -- Colorscheme: catppuccin
  require 'custom.plugins.configs.catppuccin',

  -- statusline
  require 'custom.plugins.configs.lualine',

  -- for better formatting
  require 'custom.plugins.configs.indent-blankline',

  require 'custom.plugins.configs.markdown-preview',

  require 'custom.plugins.configs.twilight',

  -- Colors colors and hex codes like '#7287fd'
  require 'custom.plugins.configs.nvim-colorizer',

  -- Dashboard
  require 'custom.plugins.configs.alpha',
}

return plugins
