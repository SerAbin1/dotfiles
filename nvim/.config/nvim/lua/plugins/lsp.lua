-- require("mason").setup()

-- LSP keymaps (attached per buffer)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buf = args.buf

    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = buf, desc = desc })
    end

    -- Navigation
    map("gd", require("snacks").picker.lsp_definitions, "Goto Definition")
    map("gr", require("snacks").picker.lsp_references, "References")
    map("gi", require("snacks").picker.lsp_implementations, "Implementations")
    map("<leader>ds", require("snacks").picker.lsp_symbols, "Document Symbols")

    -- Info
    if client.server_capabilities.hoverProvider then
      map("K", vim.lsp.buf.hover, "Hover")
    end

    map("<leader>h", vim.lsp.buf.signature_help, "Signature help")

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

-- Server configurations
vim.lsp.config("gopls", {
  cmd = { "gopls" },
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("dartls", {
  cmd = { vim.fn.expand("dart"), "language-server", "--protocol=lsp" },
})

vim.lsp.config("kotlin-language-server", {
  cmd = { "kotlin-language-server" },
  filetypes = { "kotlin" }
  -- root_markers = { "settings.gradle.kts", "settings.gradle", "build.gradle.kts", "build.gradle", ".git" },
})

vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
})

vim.lsp.config("vtsls", {
  cmd = { "vtsls" },
})

-- Enable all servers
for _, server in ipairs({ "gopls", "lua_ls", "dartls", "kotlin-language-server", "rust_analyzer", "vtsls" }) do
  vim.lsp.enable(server)
end
