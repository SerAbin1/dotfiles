return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		priority = 1000,
		build = ":TSUpdate",
		-- dependencies = {
		-- 	"nvim-treesitter/nvim-treesitter-textobjects",
		-- },
		config = function()
			local status_ok, configs = pcall(require, "nvim-treesitter.configs")
			if not status_ok then
				vim.notify("Failed to load nvim-treesitter.configs", vim.log.levels.WARN)
				return
			end

			configs.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				-- textobjects = {
				-- 	select = {
				-- 		enable = true,
				-- 		lookahead = true,
				-- 		keymaps = {
				-- 			["af"] = "@function.outer",
				-- 			["if"] = "@function.inner",
				-- 			["ac"] = "@class.outer",
				-- 			["ic"] = "@class.inner",
				-- 		},
				-- 	},
				-- },
			})
		end,
	},
}
