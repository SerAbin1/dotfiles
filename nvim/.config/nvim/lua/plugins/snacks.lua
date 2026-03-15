return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true }, -- disables lsp, treesitter etc in big files to keep perf
    -- dashboard = { enabled = true }, -- alpha alternative
    explorer = { enabled = true }, -- file explorer
    input = { enabled = true }, -- better input
    -- picker = { enabled = true }, -- telescope alternative
    notifier = { enabled = true }, -- better notification (floating)
    quickfile = { enabled = true }, -- Opens files faster by deferring plugin loading. Fully automatic.
    scope = { enabled = true }, -- Detects current code scope (function, block, etc.). Used by other plugins/indentation.
    scroll = { enabled = true }, -- smooth scrolling
    statuscolumn = { enabled = true }, -- nicer left statuscolumn
    words = { enabled = true }, --  Highlights all occurrences of the word under your cursor.
  },
  keys = {
    { "<leader>e", function() Snacks.explorer() end, desc = "Toggle file explorer" },
  },
}
