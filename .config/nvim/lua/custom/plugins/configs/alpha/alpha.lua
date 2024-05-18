local M = {}

function M.setup()
  -- Import alpha and dashboard
  local status_ok, alpha = pcall(require, 'alpha')
  if not status_ok then
    return
  end
  local dashboard = require 'alpha.themes.dashboard'

  -- Define custom icons
  local icons = {
    ui = {
      file = '',
      open_folder = '',
      config = '',
      close = '',
    },
  }

  local function center_header(header)
    local width = vim.api.nvim_win_get_width(0) -- Get the width of the current window
    local padding = math.floor((width - #header[1]) / 2) -- Calculate padding based on the first line length
    for i, line in ipairs(header) do
      header[i] = string.rep(' ', padding) .. line
    end
    return header
  end

  -- Define custom header with ASCII art or any custom message
  local head = {
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
    [[       ████ ██████           █████      ██                     ]],
    [[      ███████████             █████                             ]],
    [[      █████████ ███████████████████ ███   ███████████   ]],
    [[     █████████  ███    █████████████ █████ ██████████████   ]],
    [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
    [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
    [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
    [[                                                                       ]],
  }

  -- Define the buttons for the dashboard
  --
  --
  local buttons = {
    dashboard.button('f', icons.ui.file .. '  Recent Files', '<cmd>Telescope oldfiles<CR>'),
    dashboard.button('o', icons.ui.open_folder .. '  Explorer', '<cmd>lua MiniFiles.open()<cr>'),
    dashboard.button(
      'c',
      icons.ui.config .. '  Neovim config',
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown { cwd = vim.fn.stdpath 'config' })<CR>"
    ),
    dashboard.button('l', '󰒲  Lazy', '<cmd>Lazy<cr>'),
    dashboard.button('q', icons.ui.close .. '  Quit NVIM', ':qa<CR>'),
  }
  -- Custom footer showing number of plugins loaded
  local footer = {
    type = 'text',
    val = { '⚡' .. require('lazy').stats().loaded .. ' plugins loaded.' },
    opts = { position = 'center', hl = 'Comment' },
  }

  -- Custom section with a personal greeting
  local bottom_section = {
    type = 'text',
    val = "Hi gn, It's " .. os.date '%I:%M %p, ' .. 'How are you doing today?',
    opts = { position = 'center' },
  }

  -- Setting up the alpha layout
  alpha.setup {
    layout = {
      { type = 'padding', val = 8 },
      { type = 'text', val = head, opts = { position = 'center', hl = 'Function' } },
      { type = 'padding', val = 2 },
      { type = 'group', val = buttons, opts = { spacing = 1 } },
      { type = 'padding', val = 1 },
      bottom_section,
      { type = 'padding', val = 1 },
      footer,
    },
  }
end

return M
