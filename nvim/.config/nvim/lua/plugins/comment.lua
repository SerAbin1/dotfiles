return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>cc",
			mode = { "n", "v" },
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			desc = "Comment toggle current line",
		},
	},
	opts = {
		-- add any options here
	},
}
