vim.g.mapleader = " "

-----------Tab 2 for WebDev and 4 else------------------
vim.api.nvim_create_augroup("CustomTabSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = "CustomTabSettings",
    pattern = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "css" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = "CustomTabSettings",
    pattern = { "c", "cpp", "md" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.expandtab = true
    end,
})

-----------Tab section end-------------------------

-----------------Autosave section----------------
-- Autosave toggle flag
local autosave_enabled = true

-- Function to enable or disable autosave autocmd
local function set_autosave(enabled)
  if enabled then
    vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
      group = vim.api.nvim_create_augroup("MyAutoSaveGroup", { clear = true }),
      pattern = "*",
      command = "wall",
    })
    print("Autosave enabled")
  else
    vim.api.nvim_del_augroup_by_name("MyAutoSaveGroup")
    print("Autosave disabled")
  end
  autosave_enabled = enabled
end

-- Initially enable autosave
set_autosave(true)

-- Map <Space>s to toggle autosave
vim.keymap.set("n", "<leader>s", function()
  set_autosave(not autosave_enabled)
end, { desc = "Toggle autosave" })

--------------Autosave section end------------------

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

-- Remap Delete to Escape in Insert mode
vim.api.nvim_set_keymap('i', '<Del>', '<Esc>', { noremap = true, silent = true })
-- Remap <leader>w to :wq (save and quit) in Normal mode
vim.keymap.set('n', '<leader>q', ':wq<CR>', { noremap = true, silent = true })
-- Remap <leader>q to :q (quit) in Normal mode
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
-- Map <leader>cd to :Copilot disable
vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true })
