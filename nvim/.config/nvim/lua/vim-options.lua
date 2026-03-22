vim.g.mapleader = " "

-----------Tab 2 for WebDev, JSON and 4 else-----------------
vim.api.nvim_create_augroup("CustomTabSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = "CustomTabSettings",
    pattern = { "*" },
    callback = function()
        local two_space = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "json", "lua", "java" }
        local ft = vim.bo.filetype
        local indent = vim.tbl_contains(two_space, ft) and 2 or 4

        vim.opt_local.tabstop = indent
        vim.opt_local.shiftwidth = indent
        vim.opt_local.expandtab = true
    end,
})
-----------Tab section end-------------------------

--------------Diagnostics-----------------------------
vim.diagnostic.config({
	signs = {
		severity = {
			min = vim.diagnostic.severity.WARN, -- hide HINT and INFO
		},
	},
	virtual_text = {
		severity = {
			min = vim.diagnostic.severity.WARN,
		},
	},
	underline = true,
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic in float" })

---------------------------------------------------------


vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true

-- Remap <leader>q to :wq (save and quit) in Normal mode
vim.keymap.set("n", "<leader>q", ":wq<CR>", { noremap = true, silent = true })
-- Remap <leader>w to :w (write) in Normal mode
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
-- Map <leader>cd to :Copilot disable
vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true })
