return {
  'catppuccin/nvim',
  name = 'catppuccin',
  opts = {
    term_colors = true,
    transparent_background = false,
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
    },
    color_overrides = {
      mocha = {
        base = '#000000',
        mantle = '#000000',
        crust = '#000000',
        blue = '#7287FD',
      },
    },
    integrations = {
      telescope = {
        enabled = true,
        -- style = '',
      },
      barbar = true,
      alpha = true,
      cmp = true,
      which_key = true,
      markdown = true,
      bufferline = false,
    },
    custom_highlights = function(colors)
      return {
        TabLineSel = { bg = colors.blue },
        WinSeparator = { bg = colors.blue },
        TelescopePromptPrefix = { fg = colors.blue },
        TelescopeSelectionCaret = { fg = colors.blue },
        String = { style = { 'italic' } },
        Function = { style = { 'italic' } },
        Conditional = { style = { 'italic' } },
        BufferCurrent = { bg = colors.base },
        BufferCurrentIndex = { bg = colors.base },
        BufferCurrentMod = { bg = colors.base },
        BufferCurrentSign = { bg = colors.base },
      }
    end,
  },
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'catppuccin'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
