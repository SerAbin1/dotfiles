require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
    },
    completion = {
        accept = { auto_brackets = { enabled = true } },
        menu = { auto_show = true },
    },
    sources = {
        default = { "lsp", "buffer", "path" },
    },
})
