return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects", -- add this
		},
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },

				-- add this block
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- automatically jump forward to textobject
						keymaps = {
							["af"] = "@function.outer", -- around entire function
							["if"] = "@function.inner", -- inside function body only
							["ac"] = "@class.outer", -- optional: select around class
							["ic"] = "@class.inner",
						},
					},
				},
			})
		end,
	},
}
