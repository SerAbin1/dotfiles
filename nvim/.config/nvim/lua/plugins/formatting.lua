local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
    java = { "google-java-format" },
    go = { "gofumpt", "goimports" },
    rust = { "rustfmt" }
  },
  formatters = {
    prettier = {},
  },
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat then
      return nil
    end
    return {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    }
  end,
})

vim.g.disable_autoformat = false

vim.keymap.set("n", "<leader>p", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  vim.notify(
    "Autoformat " .. (vim.g.disable_autoformat and "disabled" or "enabled"),
    vim.log.levels.INFO
  )
end, { desc = "Toggle autoformat on save (global)" })
