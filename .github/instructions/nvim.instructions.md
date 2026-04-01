---
applyTo: "dot_config/nvim/**"
---

This is a Neovim configuration written in Lua, using [lazy.nvim](https://lazy.folke.io/) as the plugin manager.

## Entry Point

`dot_config/nvim/init.lua` contains a single line:

```lua
require("config.lazy")
```

## Config Modules (`lua/config/`)

| File | Purpose |
|---|---|
| `lazy.lua` | Bootstraps lazy.nvim, loads core modules, calls `require("lazy").setup("plugins")` |
| `options.lua` | All `vim.opt` settings |
| `keymaps.lua` | All `vim.keymap.set` calls |
| `autocmds.lua` | All `vim.api.nvim_create_autocmd` calls |

## Plugin Specs (`lua/plugins/`)

Each file returns a table of lazy.nvim plugin specs. lazy.nvim auto-discovers all files in `lua/plugins/` — no manual `require` calls needed.

To add a new plugin, create a new `.lua` file in `lua/plugins/` returning a spec table:

```lua
return {
  {
    "author/plugin-name",
    opts = {},
  },
}
```

## Key Conventions

- Leader key is `,` (set in `lazy.lua` before plugins load)
- `opts = {}` is preferred over `config = function() require("x").setup({}) end` when no extra logic is needed
- `keys = {}` in a spec lazy-loads the plugin and registers the keymap simultaneously
- Diagnostic signs use unicode: `✘` for errors, `⚠` for warnings
