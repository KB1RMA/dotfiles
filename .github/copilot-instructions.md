# Dotfiles Repository — Copilot Instructions

This repository manages personal dotfiles using [chezmoi](https://www.chezmoi.io/).

## Key chezmoi File Naming Conventions

| Prefix / Suffix | Meaning |
|---|---|
| `dot_` | Maps to a `.` (hidden) file/dir in `$HOME`. e.g. `dot_zshrc` → `~/.zshrc` |
| `private_` | Target file gets `600` permissions |
| `.tmpl` suffix | Processed as a Go template before being written |
| `dot_config/` | Maps to `~/.config/` |

Work machines have hostnames prefixed with `LIBP`. Templates use `hasPrefix "LIBP" .chezmoi.hostname` to conditionally apply work-specific settings.

