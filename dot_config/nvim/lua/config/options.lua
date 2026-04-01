-- Ensure nvm's default node is in PATH so LSP servers (e.g. typescript-tools) can find npm/tsserver
local nvm_alias = io.open(vim.fn.expand("$HOME/.nvm/alias/default"), "r")
if nvm_alias then
  local version = nvm_alias:read("*l")
  nvm_alias:close()
  -- Resolve indirect aliases (e.g. "lts/*" → "lts/iron" → "v20.x.x")
  for _ = 1, 3 do
    local indirect = io.open(vim.fn.expand("$HOME/.nvm/alias/" .. version), "r")
    if indirect then
      version = indirect:read("*l")
      indirect:close()
    else
      break
    end
  end
  local node_bin = vim.fn.expand("$HOME/.nvm/versions/node/" .. version .. "/bin")
  if vim.fn.isdirectory(node_bin) == 1 then
    vim.env.PATH = node_bin .. ":" .. vim.env.PATH
  end
end

local opt = vim.opt

opt.encoding    = "utf-8"
opt.bomb        = false

-- Indentation
opt.shiftwidth  = 2
opt.tabstop     = 2
opt.expandtab   = true
opt.smarttab    = true
opt.autoindent  = true
opt.backspace   = { "indent", "eol", "start" }

-- Display
opt.wrap        = false
opt.number      = true
opt.cursorline  = true
opt.visualbell  = true
opt.title       = true
opt.clipboard   = "unnamed"
opt.termguicolors = true

-- Spell checking
opt.spell       = true

-- Search
opt.hlsearch    = true

-- Buffers
opt.hidden      = true
opt.history     = 1000

-- Completion
opt.wildmenu    = true
opt.wildmode    = "list:longest"

-- Folding
opt.foldcolumn      = "4"
opt.foldenable      = true
opt.foldlevelstart  = 99
opt.foldmethod      = "indent"

-- Format options
opt.formatoptions = "croqn2l1j"

-- Diff
opt.diffopt:append("iwhite")

-- Show invisible characters
opt.list      = true
opt.listchars = { tab = ">-", trail = "·" }

-- Backup / swap in /tmp
opt.backup    = true
opt.directory = "/tmp"
opt.backupdir = "/tmp"

-- Diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",  { text = "⚠", texthl = "DiagnosticSignWarn" })
