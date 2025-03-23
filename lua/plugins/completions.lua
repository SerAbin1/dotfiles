return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    -- Commented out so snippets are not used initially
    -- enabled = false,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      -- require("luasnip.loaders.from_vscode").lazy_load() -- Commented out to disable snippet loading

      cmp.setup({
        snippet = {
          expand = function(args)
            -- require("luasnip").lsp_expand(args.body) -- Commented out to disable snippet expansion
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = "luasnip" }, -- Commented out to disable snippets
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
