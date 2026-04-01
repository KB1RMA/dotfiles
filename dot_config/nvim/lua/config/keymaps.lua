local map = vim.keymap.set

-- Speed up viewport scrolling
map("n", "<C-e>", "3<C-e>")
map("n", "<C-y>", "3<C-y>")

-- Faster split resizing
map("n", "+", "<C-W>+")
map("n", "-", "<C-W>-")

-- Better split switching
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-l>", "<C-W>l")

-- Toggle folds (<Space>)
map("n", "<space>", function()
  if vim.fn.foldclosed(".") > 0 then
    vim.cmd("silent! normal! zMzx")
  else
    vim.cmd("silent! normal! zc")
  end
end, { silent = true })

-- Session management
map("n", "<F2>", ":mksession! ~/vim_session<CR>")
map("n", "<F3>", ":source ~/vim_session<CR>")
