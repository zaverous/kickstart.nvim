-- required in which-key plugin spec in plugins/ui.lua as `require 'config.keymap'`
P = vim.print

local nmap = function(key, effect)
  vim.keymap.set('n', key, effect, { silent = true, noremap = true })
end

local vmap = function(key, effect)
  vim.keymap.set('v', key, effect, { silent = true, noremap = true })
end

local imap = function(key, effect)
  vim.keymap.set('i', key, effect, { silent = true, noremap = true })
end

local cmap = function(key, effect)
  vim.keymap.set('c', key, effect, { silent = true, noremap = true })
end

-- move in command line
cmap('<C-a>', '<Home>')

-- save with ctrl+s
imap('<C-s>', '<esc>:update<cr><esc>')
nmap('<C-s>', '<cmd>:update<cr><esc>')

-- Move between windows using <ctrl> direction
nmap('<C-j>', '<C-W>j')
nmap('<C-k>', '<C-W>k')
nmap('<C-h>', '<C-W>h')
nmap('<C-l>', '<C-W>l')

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', 'kj', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Map 'kj' to behave like <Esc>
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true }) -- In insert mode
vim.keymap.set('v', 'kj', '<Esc>', { noremap = true, silent = true }) -- In visual mode
vim.keymap.set('c', 'kj', '<C-c>', { noremap = true, silent = true }) -- In command-line mode

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
-- navigation between panes
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- move these into macros lua
-- macros
vim.keymap.set('n', '<Leader>nc', '0i#<Space>cell<Esc>yyo<Esc>p', { desc = 'New cell', remap = true })
vim.keymap.set('n', '<Leader>na', '?#<Space>cell<cr>j<S-v>Nk', { desc = 'nall cell', remap = true })
