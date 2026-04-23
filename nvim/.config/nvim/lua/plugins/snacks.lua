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

  picker = {
  enabled = true,
  on_show = function()
    vim.cmd("stopinsert")
  end,
  win = {
    input = {
      insert = false,
    },
  },
},
})

local pick = snacks.picker

vim.keymap.set("n", "<leader>f", function()
  pick.files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>o", function()
  pick.recent()
end, { desc = "Old files" })

vim.keymap.set("n", "<leader>wg", function()
  pick.grep_word()
end, { desc = "[S]earch Current [W]ord" })

-- override: grep pickers start in INSERT mode
vim.keymap.set("n", "<leader>lg", function()
  pick.grep({
    on_show = function()
      vim.cmd("startinsert")
    end,
    win = {
      input = { insert = true },
    },
  })
end, { desc = "Live grep" })

vim.keymap.set("n", "<leader>c", function()
  pick.git_log()
end, { desc = "Git commits" })

vim.keymap.set("n", "<leader>b", function()
  pick.buffers()
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>e", function()
  snacks.explorer()
end)

vim.keymap.set("n", "<leader>k", function()
  pick.files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Find files (current dir)" })

vim.keymap.set("n", "gd", function()
  pick.lsp_definitions()
end, { desc = "Goto Definition (picker)" })

vim.keymap.set("n", "gr", function()
  pick.lsp_references()
end, { desc = "References" })

vim.keymap.set("n", "gi", function()
  pick.lsp_implementations()
end, { desc = "Implementations" })

vim.keymap.set("n", "<leader>ds", function()
  pick.lsp_symbols()
end, { desc = "Document Symbols" })
