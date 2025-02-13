return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP completions
    "hrsh7th/cmp-buffer", -- Buffer completions
    "hrsh7th/cmp-path", -- File path completions
    "L3MON4D3/LuaSnip", -- Snippets
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function()
    local cmp = require("cmp")
    return {
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      },
    }
  end,
}
