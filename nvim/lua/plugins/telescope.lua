return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local fb_actions = telescope.extensions.file_browser.actions
			local builtin = require("telescope.builtin")

			telescope.setup({
				extensions = {
					file_browser = {
						initial_mode = "normal",
						hijack_netrw = true,
						mappings = {
							-- This is the "Normal Mode" section
							["n"] = {
								["a"] = fb_actions.create,
								["r"] = fb_actions.rename,
								["m"] = fb_actions.move,
								["d"] = fb_actions.remove,
							},
						},
					},
				},
			})
			telescope.load_extension("file_browser")

			-- Keybinds
			vim.keymap.set("n", "<leader>f", builtin.find_files, {})
			vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>b", builtin.buffers, {})
			vim.keymap.set("n", "<leader>j", ":Telescope file_browser<CR>", { noremap = true })
		-- Open file browser at current buffer's directory (useful for deep nested paths)
		vim.keymap.set("n", "<leader>jj", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
		end,
	},
}
