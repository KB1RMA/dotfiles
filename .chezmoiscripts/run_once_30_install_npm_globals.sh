#!/bin/bash

# Load nvm so npm is available
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# run_once_20_install_nvm.sh installs the default LTS release, but re-running
# this (idempotent when already installed) makes this script self-sufficient too.
nvm install --lts

# Install global npm packages needed for Neovim LSP and linting
npm install -g \
  typescript \
  typescript-language-server \
  eslint_d
