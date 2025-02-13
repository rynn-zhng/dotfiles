return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "c", "cpp", "lua", "python" },
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
