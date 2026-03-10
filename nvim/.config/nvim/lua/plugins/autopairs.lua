return {
  'windwp/nvim-autopairs',
lazy = false, -- Ensures it loads on startup
 priority = 1000, -- Optional: Ensures it's loaded early
 config = function()
   require("nvim-autopairs").setup({})
 end
}
