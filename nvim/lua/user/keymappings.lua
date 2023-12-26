local set = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader=" "
vim.g.maplocalleader=" "

-- Normal mode
set('n', ';', ':')
set('n', 'J', '2<C-e>')
set('n', 'K', '2<C-y>')
set('n', ',', '2j', opts)
set('n', '.', '2k', opts)
set('n', '>', '<PageUp>', opts)
set('n', '<', '<PageDown>', opts)

    -- Window navigation
set('n', '<C-j>', '<C-w>j')
set('n', '<C-k>', '<C-w>k')
set('n', '<C-h>', '<C-w>h')
set('n', '<C-l>', '<C-w>l')
set('n', '<C-a>', '<C-w>v', opts)
set('n', '<C-b>', '<C-w>s', opts)

    -- Buffer navigation
set('n', '<S-l>', ':bnext<CR>', opts)
set('n', '<S-h>', ':bprevious<CR>', opts)

set('n', 'm', 'u<C-r>', opts)
set('n', '<leader>e', ':NvimTreeToggle<CR>')
set('n', 'qq', ':qa<CR>', opts)
-- Visual mode
set('v', ';', ':')
set('v', 'J', '2<C-e>')
set('v', 'K', '2<C-y>')
set('v', 'q', '<esc>', opts)
set('v', ',', '2j', opts)
set('v', '.', '2k', opts)

    -- Easier tabbing
set('v', '<', '<gv', opts)
set('v', '>', '>gv', opts)

-- Insert mode
set('i', 'jk', '<esc>')
set('i', 'kj', '<esc>')

-- Select mode
set('s', 'jk', '<esc>$a', opts)
set('s', 'kj', '<esc>$a', opts)

-- Terminal mode
set('t', '<esc', [[<C-\><C-n>]], opts)
set('t', 'jk', [[<C-\><C-n>]], opts)
-- These are not working atm
set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)
set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
set("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
set("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
