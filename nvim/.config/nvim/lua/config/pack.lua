vim.pack.add({
    "https://github.com/catppuccin/nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/windwp/nvim-ts-autotag",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/folke/snacks.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/echasnovski/mini.ai",
    "https://github.com/nickjvandyke/opencode.nvim",
    { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
})

require("plugins.lsp")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.autotag")
require("plugins.gitsigns")
require("plugins.lualine")
require("plugins.formatting")
require("plugins.snacks")
require("plugins.opencode-nvim")
require("plugins.completions")
vim.cmd.colorscheme("catppuccin-mocha")
