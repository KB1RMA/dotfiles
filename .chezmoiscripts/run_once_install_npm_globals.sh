#!/bin/bash

# Load nvm so npm is available
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install global npm packages needed for Neovim LSP and linting
npm install -g \
  typescript \
  typescript-language-server \
  eslint_d
