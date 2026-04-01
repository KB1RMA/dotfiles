return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "javascript", "typescript", "python", "ruby",
        "css", "scss", "html", "json", "lua", "vim", "vimdoc",
      },
      highlight = { enable = true },
      indent    = { enable = true },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
