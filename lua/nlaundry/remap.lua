-- For general remaps. All plugin specific remaps will be in their respective plugin .lua files.
-- For ease of reading, all maps done for specific plugins will be put here too in a comment so I can find them

vim.g.mapleader = " "

-- for swapping quickly between windows
--
-- Navigate splits using the leader key
-- Move down a split
vim.api.nvim_set_keymap('n', '<leader>j', '<C-W>j', { noremap = true, silent = true })

-- Move up a split
vim.api.nvim_set_keymap('n', '<leader>k', '<C-W>k', { noremap = true, silent = true })

-- Move right a split
vim.api.nvim_set_keymap('n', '<leader>l', '<C-W>l', { noremap = true, silent = true })

-- Move left a split
vim.api.nvim_set_keymap('n', '<leader>h', '<C-W>h', { noremap = true, silent = true })

-- Remap :tabn to <leader>tn
vim.api.nvim_set_keymap('n', '<leader>tn', ':tabnext<CR>', { noremap = true, silent = true })

-- Remap :tabp to <leader>tp
vim.api.nvim_set_keymap('n', '<leader>tp', ':tabprev<CR>', { noremap = true, silent = true })

