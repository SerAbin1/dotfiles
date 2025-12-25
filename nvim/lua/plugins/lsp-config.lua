return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- List of servers to ensure are installed
			local servers = { "clangd", "ts_ls", "pyright", "jdtls", "gopls" }

			-- CONFIGURATION
			-- Register configs using vim.lsp.config (Neovim 0.11+)

			-- 1. Configure gopls with custom settings
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
							shadow = true,
							nilness = true,
							unusedwrite = true,
						},
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						staticcheck = true,
					},
				},
			})

			-- 2. Configure other servers with default settings + capabilities
			for _, server in ipairs(servers) do
				if server ~= "gopls" then
					vim.lsp.config(server, {
						capabilities = capabilities,
					})
				end
			end

			-- SETUP MASON-LSPCONFIG
			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,
			})
			
			-- Enable servers explicitly? 
			-- mason-lspconfig v2's 'automatic_enable' (if active) will enable them.
			-- If not, we can iterate and enable. But usually vim.lsp.config is sufficient for auto-start on filetype?
			-- Actually, standard vim.lsp.start logic relies on filetype autocomamnds.
			-- If we want to be sure:
			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end
		end,
	},
}
