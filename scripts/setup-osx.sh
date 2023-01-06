#!/bin/bash

# brew stuff - TODO: add stuff soon
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim tmux
brew install --cask rectangle

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
