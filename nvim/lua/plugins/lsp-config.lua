return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- Setup for C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			-- Setup for JavaScript/TypeScript
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- Setup for Python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- Java (Eclipse JDT LS)
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})

			-- Setup for Go
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						completeUnimported = true, -- Auto-import packages
						usePlaceholders = true, -- Add placeholders for function parameters
						analyses = {
							unusedparams = true,
							shadow = true, -- Warn when you accidentally shadow a variable (very useful)
							nilness = true, -- Warn about useless nil checks
							unusedwrite = true, -- Warn about writes to variables that are never read,
						},

						-- Enable "codelens" (actionable text appearing above code)
						codelenses = {
							gc_details = false, -- Show where the compiler makes optimization choices
							generate = true, -- Show a "run" link for //go:generate directives
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true, -- Show "Run test" / "Debug test" above test functions
							tidy = true, -- Show "Run go mod tidy" if go.mod is dirty
						},

						-- Enable inlay hints (ghost text showing variable types/names)
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},

						-- Enable staticcheck (an advanced linter) directly in gopls
						staticcheck = true,
					},
				},
			})

			-- Common key mappings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
