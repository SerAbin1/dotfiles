return {
	"L3MON4D3/LuaSnip",
	event = "InsertEnter",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local luasnip = require("luasnip")

		-- Load Lua-based snippets if any
		require("luasnip.loaders.from_lua").lazy_load({
			paths = { "~/.config/nvim/lua/snippets" }, -- Lua snippets dir
		})

		-- Extend filetypes
		luasnip.filetype_extend("javascriptreact", { "javascript" })

		-- Tab to jump forward
		vim.keymap.set({ "i", "s" }, "<Tab>", function()
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				return "<Tab>"
			end
		end, { expr = true, silent = true })

		-- Shift-Tab to jump backward
		vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				return "<S-Tab>"
			end
		end, { expr = true, silent = true })

		-- Choice nodes: <C-l> to cycle choices
		vim.keymap.set({ "i", "s" }, "<C-l>", function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { silent = true })
	end,
}
