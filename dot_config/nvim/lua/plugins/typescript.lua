return {
  -- TypeScript LSP
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        javascript      = { "eslint_d" },
        typescript      = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
      }
      vim.api.nvim_create_autocmd("BufWritePost", {
        group   = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
        pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  -- Formatting: runs eslint_d --fix on save for JS/TS files, replicating
  -- VS Code's "editor.codeActionsOnSave: source.fixAll.eslint" behaviour.
  -- ,d triggers a manual format. lsp_format = "fallback" means conform will
  -- defer to the LSP formatter if no conform formatter is configured for the
  -- current filetype.
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript      = { "eslint_d" },
          typescript      = { "eslint_d" },
          javascriptreact = { "eslint_d" },
          typescriptreact = { "eslint_d" },
        },
        format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
      })
      -- ,d to format (mirrors the old <leader>d <Plug>(ale_fix))
      vim.keymap.set("n", "<leader>d", function()
        require("conform").format({ async = true })
      end, { desc = "Format file" })
    end,
  },
}
