require("nvim-treesitter").setup({
    ensure_installed = {
        "go", "lua", "bash", "json", "yaml", "toml", "markdown", "markdown_inline",
        "html", "css", "javascript", "typescript", "cpp", "c",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
        disable = { "python" },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
})