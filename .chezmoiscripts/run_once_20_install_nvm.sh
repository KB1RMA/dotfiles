#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install the latest LTS release and set it as the default alias, so npm is
# available to any script that sources nvm.sh (e.g. run_once_30_install_npm_globals.sh)
nvm install --lts
