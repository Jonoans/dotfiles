#!/bin/bash

# brew stuff - TODO: add stuff soon
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install neovim tmux fsouza/prettierd/prettierd rust clang-format
brew install --cask rectangle

cargo install stylua

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
