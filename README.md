# Dotfiles

[![chezmoi](https://img.shields.io/badge/managed%20by-chezmoi-blue?logo=chezmoi&style=for-the-badge)](https://www.chezmoi.io/)

This repository contains dotfile configurations managed with [chezmoi](https://www.chezmoi.io/).

## Setup on a New Machine

See https://www.chezmoi.io/quick-start/#set-up-a-new-machine-with-a-single-command

1. Install Homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
1. Install [`chezmoi`](https://www.chezmoi.io/install/) with `brew install chezmoi`
2. Run `chezmoi init --apply KB1RMA`

## Making Changes

The chezmoi repository is located at `~/.local/share/chezmoi`. To make changes:

1. Edit files in `~/.local/share/chezmoi`
2. Review changes with `chezmoi diff`
3. Apply changes with `chezmoi apply`
4. Commit and push changes to the repository