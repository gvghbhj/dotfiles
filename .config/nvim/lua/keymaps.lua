-- [[ Basic Keymaps ]] See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--
-- better j and k movement
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>sp', '<cmd>set spell!<CR>', { desc = 'toggle spell check' })

vim.keymap.set('n', '-', '<cmd>lua MiniFiles.open()<CR>', { desc = 'opens mini.files' })

vim.keymap.set('n', '<leader>dd', '<cmd>Alpha<CR>', { desc = 'Alpha dashboard' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'move focus to left split' })

vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'move focus to lower split' })

vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'move focus to upper split' })

vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'move window focus to right split' })

vim.keymap.set('n', '<A-c>', '<C-w>x', { desc = 'swap with next split' })

vim.keymap.set('n', '<C-.>', '<cmd>vertical resize +5<CR>', { desc = 'Increase size of split vertically by 5' })

vim.keymap.set('n', '<C-,>', '<cmd>vertical resize -5<CR>', { desc = 'Decrease size of split vertically by 5' })

vim.keymap.set('n', '<A-t>', '<cmd>resize +5<CR>', { desc = 'Increase size of slpit horizontally by 5' })

vim.keymap.set('n', '<A-s>', '<cmd>resize -5<CR>', { desc = 'Decreasecrease size of slpit horizontally by 5' })

vim.keymap.set('n', '<A-v>', '<cmd>vsplit<CR>', { desc = 'open a vertical split' })

vim.keymap.set('n', '<A-h>', '<cmd>split<CR>', { desc = 'open a normal horizonatl slpit' })

vim.keymap.set('n', '<A-x>', '<cmd>close<CR>', { desc = 'Close split' })

vim.keymap.set('n', '<leader>mr', '<cmd>MarkdownPreview<CR>', { desc = 'Open markdown preview in browser' })

vim.keymap.set('n', '<leader>z', '<cmd>Twilight<CR>', { desc = 'Toggle twilight' })

vim.keymap.set('n', '<leader>n', '<cmd>set nonumber! norelativenumber! nonumber!<CR>', { desc = 'Toggle relative number' })

vim.cmd 'cabbrev help vert help'

--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- A function that zooms in to current buffer, and opens twilight. Useful for writing documents, where stuff like lualine and barbar can be distracting.
vim.keymap.set('n', '<A-z>', function()
  -- Get initial height then see if height afer .zoom is bigger, to determine if we zooming in or out.
  local initial_height = vim.api.nvim_win_get_height(0)
  MiniMisc.zoom()
  local changed_height = vim.api.nvim_win_get_height(0)
  -- Checks if twilight is enabled
  local is_enabled = require('twilight.view').enabled
  if is_enabled and changed_height <= initial_height then
    vim.cmd 'TwilightDisable'
  else
    if changed_height > initial_height then
      vim.cmd 'TwilightEnable'
    end
  end

  if changed_height > initial_height then
    os.execute 'kitten @ set-font-size -- +2'
  else
    os.execute 'kitten @ set-font-size -- -2'
  end
end, { desc = 'Toggles fullscreen + Twilight mode' })

vim.keymap.set('n', ';', ':', { desc = 'Go to command mode' })

vim.keymap.set('v', '<', '<gv', { desc = 'Better indentation' })
vim.keymap.set('v', '>', '>gv', { desc = 'better indentation' })

-- set of functions that increase cmdline height when recording a macro.
vim.api.nvim_create_autocmd('RecordingEnter', {
  pattern = '*',
  callback = function()
    vim.opt_local.cmdheight = 1
  end,
})

vim.api.nvim_create_autocmd('RecordingLeave', {
  pattern = '*',
  callback = function()
    local timer = vim.loop.new_timer()
    -- NOTE: Timer is here because we need to close cmdheight AFTER
    -- the macro is ended, not during the Leave event
    timer:start(
      50,
      0,
      vim.schedule_wrap(function()
        vim.opt_local.cmdheight = 0
      end)
    )
  end,
})

vim.keymap.set('n', '<leader>j', "<CMD>:%!jq '.'<CR>", { desc = 'Formates json file with jq' })

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'sets variable for when terminal opens',
  callback = function()
    vim.cmd "let g:terminal_color_2 = '#7287fd'"
    vim.cmd 'set spell!'
    vim.cmd 'set nonumber! norelativenumber! nonumber!'
    vim.cmd 'startinsert'
  end,
})

if vim.g.neovide then
  vim.keymap.set('n', '<C-=>', function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.25
  end, { desc = 'Zoom in' })

  vim.keymap.set('n', '<C-->', function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * (1 / 1.25)
  end, { desc = 'Zoom out' })

  vim.keymap.set('n', '<C-e>', '<CMD>lua vim.g.neovide_scale_factor = 1<CR>', { desc = 'set scale factor back to 1' })

  vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy
  vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

  vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
end
-- vim: ts=2 sts=2 sw=2 et
