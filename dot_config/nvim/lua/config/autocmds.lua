-- Filetype detection
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group    = vim.api.nvim_create_augroup("json_ft", { clear = true }),
  pattern  = "*.json",
  callback = function() vim.bo.filetype = "json" end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group    = vim.api.nvim_create_augroup("ruby_ft", { clear = true }),
  pattern  = { "Rakefile", "Capfile", "Gemfile", ".autotest", ".irbrc", "*.treetop", "*.tt" },
  callback = function() vim.bo.filetype = "ruby" end,
})

-- Reload config on save
vim.api.nvim_create_autocmd("BufWritePost", {
  group    = vim.api.nvim_create_augroup("reload_config", { clear = true }),
  pattern  = vim.fn.stdpath("config") .. "/init.lua",
  callback = function() dofile(vim.fn.stdpath("config") .. "/init.lua") end,
})
