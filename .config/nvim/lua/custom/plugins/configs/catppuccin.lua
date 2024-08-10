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
        base = '#11111b',
        mantle = '#11111b',
        crust = '#11111b',
        blue = '#789beb',
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
      mini = {
        enabled = true,
      },
    },
    custom_highlights = function(colors)
      return {
        TabLineSel = { bg = colors.blue },
        WinSeparator = { fg = colors.blue },
        TelescopePromptPrefix = { fg = colors.blue },
        TelescopeSelectionCaret = { fg = colors.blue },
        BufferCurrent = { bg = colors.base },
        BufferCurrentIndex = { bg = colors.base },
        BufferCurrentMod = { bg = colors.base },
        BufferCurrentSign = { bg = colors.base },
        MiniStarterQuery = { fg = colors.lavender },
        MiniIndentscopeSymbolOff = { fg = colors.surface0 },
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
