vim.g.mapleader = " "

-----------Tab 2 for WebDev, JSON and 4 else-----------------
vim.api.nvim_create_augroup("CustomTabSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = "CustomTabSettings",
	pattern = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "json", "lua", "java" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = "CustomTabSettings",
	pattern = { "c", "cpp", "md", "go" },
	callback = function()
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
	end,
})

-----------Tab section end-------------------------

-----------------Autosave section----------------
-- Autosave toggle flag
local autosave_enabled = true

-- Function to enable or disable autosave autocmd
local function set_autosave(enabled)
	if enabled then
		vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
			group = vim.api.nvim_create_augroup("MyAutoSaveGroup", { clear = true }),
			pattern = "*",
			command = "wall",
		})
	else
		vim.api.nvim_del_augroup_by_name("MyAutoSaveGroup")
		print("Autosave disabled")
	end
	autosave_enabled = enabled
end

-- Initially enable autosave
set_autosave(true)

-- Map <Space>s to toggle autosave
vim.keymap.set("n", "<leader>s", function()
	set_autosave(not autosave_enabled)
end, { desc = "Toggle autosave" })

--------------Autosave section end--------------------

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
