vim.api.nvim_create_augroup("CustomTabSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = "CustomTabSettings",
    pattern = { "*" },
    callback = function()
        local two_space = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "json", "lua", "java" }
        local ft = vim.bo.filetype
        local indent = vim.tbl_contains(two_space, ft) and 2 or 4

        vim.opt_local.tabstop = indent
        vim.opt_local.shiftwidth = indent
        vim.opt_local.expandtab = true
    end,
})

vim.diagnostic.config({
    signs = {
        severity = {
            min = vim.diagnostic.severity.WARN,
        },
    },
    virtual_text = {
        severity = {
            min = vim.diagnostic.severity.WARN,
        },
    },
    underline = true,
})

-- Builtin LSP completion setup
vim.o.autocomplete = true

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    end,
})