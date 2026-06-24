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

local servers = { "dartls", "rust_analyzer", "vtsls", "lua_ls", "gopls", "kotlin-language-server" }

for _, server in ipairs(servers) do
  vim.lsp.config(server, {})
end

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

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("dartls", {
  cmd = { vim.fn.expand("~/fvm/default/bin/dart"), "language-server", "--protocol=lsp" },
})

vim.lsp.config("kotlin-language-server", {
  cmd = { "kotlin-language-server" },
  root_markers = { "settings.gradle.kts", "settings.gradle", "build.gradle.kts", "build.gradle", ".git" },
})

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end
