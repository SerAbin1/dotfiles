vim.g.mapleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Remap Delete to Escape in Insert mode
vim.api.nvim_set_keymap('i', '<Del>', '<Esc>', { noremap = true, silent = true })
-- Remap <leader>w to :wq (save and quit) in Normal mode
vim.keymap.set('n', '<leader>q', ':wq<CR>', { noremap = true, silent = true })
-- Remap <leader>q to :q (quit) in Normal mode
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
-- Map <leader>cd to :Copilot disable
vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true })
