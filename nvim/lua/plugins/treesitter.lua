return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				lazy = true, -- prevent immediate loading which crashes if treesitter isn't ready
			},
		},
		config = function()
			-- Require configs
			local configs = require("nvim-treesitter.configs")

			-- Setup treesitter
			configs.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				-- We can define textobjects config here, but we need to ensure the plugin is loaded first/during.
				-- However, nvim-treesitter will try to load modules 'textobjects.selection' etc from the RTP.
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
			})
			-- Explicitly setup hooks if needed, but usually configs.setup handles it IF the plugin is in path.
			-- With lazy=true above, we might need to manually load it?
			-- Actually, dependencies are usually loaded when the plugin loads.
			-- If we make it lazy=true, lazy.nvim might NOT add it to RTP until requested?
			-- Wait, `dependencies` in lazy.nvim: "Plugins that should be installed/loaded when this plugin is loaded".
			-- So it will load textobjects when treesitter loads.
			-- The crash happens because textobjects plugin runs `require('nvim-treesitter.configs')`.
			-- If treesitter setup hasn't run yet, but treesitter module IS in lua path, it should work.
			-- The error `module 'nvim-treesitter.configs' not found` implies it is NOT in lua path.
			-- This implies nvim-treesitter is NOT added to RTP yet when textobjects tries to run.
			
			-- Alternative Fix: Remove dependency from here and make it a separate spec that depends on treesitter.
		end,
	},
}
