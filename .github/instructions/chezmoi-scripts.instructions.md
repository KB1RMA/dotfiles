---
applyTo: ".chezmoiscripts/**"
---

These are [chezmoi](https://www.chezmoi.io/) scripts. The filename prefix controls when they run.

## Naming Conventions

| Prefix | Behaviour |
|---|---|
| `run_once_` | Runs exactly once; tracked by a hash of the script's content |
| `run_onchange_` | Reruns whenever the script content changes |

Files with a `.tmpl` suffix are Go templates processed before execution (see chezmoi-templates instructions).

## Watching Other Files for Changes

To make a `run_onchange_` script re-run when a different file changes, embed that file's hash in a comment inside the script:

```sh
# dot_vimrc hash: {{ include "dot_vimrc" | sha256sum }}
```

chezmoi treats the rendered script content as the hash key, so any change to the included file will change the hash and trigger a re-run.

## Current Scripts

Scripts are prefixed with a two-digit number to guarantee execution order.

| Script | Purpose |
|---|---|
| `run_once_10_install_bundle.sh` | Installs Homebrew packages from `.chezmoidata/packages.yml` |
| `run_once_20_install_nvm.sh` | Installs nvm |
| `run_once_30_install_npm_globals.sh` | Installs global npm packages (TypeScript, LSP, ESLint) |
| `run_onchange_darwin-install-packages.sh.tmpl` | Re-installs Homebrew packages when `packages.yml` changes |
| `run_onchange_install-vscode-extensions.sh.tmpl` | Installs VS Code extensions listed in `packages.yml` when it changes |
| `run_onchange_set_mac_os_defaults.sh` | Applies macOS system defaults |
