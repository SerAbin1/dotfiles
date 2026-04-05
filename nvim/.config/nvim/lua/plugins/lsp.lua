require("mason").setup()

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.definitionProvider then
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
        end
        if client.server_capabilities.referencesProvider then
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = args.buf, desc = "Go to references" })
        end
    end,
})

local servers = { "clangd", "ts_ls", "pyright", "jdtls", "gopls" }

vim.lsp.config("gopls", {
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

for _, server in ipairs(servers) do
    if server ~= "gopls" then
        vim.lsp.config(server, {})
    end
end

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end