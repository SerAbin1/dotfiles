require("mason").setup()

-- LSP keymaps (attached per buffer)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local buf = args.buf

        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = buf, desc = desc })
        end

        -- Info
        if client.server_capabilities.hoverProvider then
            map("K", vim.lsp.buf.hover, "Hover")
        end

        map("<leader>sh", vim.lsp.buf.signature_help, "Signature help")

        -- Refactoring
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")

      end,
})

vim.lsp.inlay_hint.enable(true)

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format({ async = false })
    end,
})

-- local servers = { "clangd", "ts_ls", "pyright", "jdtls", "gopls" }

local servers = { "clangd", "pyright", "dartls", "rust_analyzer" }

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
    if server ~= "gopls" and server ~= "dartls" then
        vim.lsp.config(server, {})
    end
end

vim.lsp.config("dartls", {
    cmd = { "dart", "language-server", "--protocol=lsp" },
})

require("mason-lspconfig").setup()

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end
