-- A file that is called if neovide is the open

-- Options:

vim.o.guifont = 'JetBrainsMono Nerd Font:h11:#e-subpixelantialias'
vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = false

-- keymaps:

vim.keymap.set('n', '<C-=>', function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * 1.10
end, { desc = 'Zoom in' })

vim.keymap.set('n', '<C-->', function()
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * (1 / 1.10)
end, { desc = 'Zoom out' })

vim.keymap.set('n', '<C-e>', '<CMD>lua vim.g.neovide_scale_factor = 1<CR>', { desc = 'set scale factor back to 1' })

vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy
vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode
vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode
vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode
vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode

-- following keymaps are required for copying and pasting in command mode
vim.api.nvim_set_keymap('', '<C-S-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-v>', '<C-R>+', { noremap = true, silent = true })
