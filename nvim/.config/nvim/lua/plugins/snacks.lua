local snacks = require("snacks")

snacks.setup({
    bigfile = { enabled = true },
    explorer = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    picker = { enabled = true },
})

local pick = snacks.picker

vim.keymap.set("n", "<leader>f",  function() pick.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>o", function() pick.recent() end, { desc = "Old files" })
vim.keymap.set("n", "<leader>g", function() pick.grep_word() end, { desc = "[S]earch Current [W]ord" })
vim.keymap.set("n", "<leader>lg", function() pick.grep() end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>c", function() pick.git_log() end, { desc = "Git commits" })
vim.keymap.set("n", "<leader>b",  function() pick.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>e",  function() snacks.explorer() end, { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>k",  function()
    pick.files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Find files (current dir)" })