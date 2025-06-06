#!/bin/bash

# brew stuff - TODO: add stuff soon
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask rectangle font-meslo-lg-nerd-font

# install tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# nvim setup
brew install neovim ripgrep fd fzf
git clone https://github.com/LazyVim/starter ~/.config/nvim

# nvim configuration
pushd ~/.config/nvim
rm -rf .git

echo "vim.lsp.set_log_level(\"ERROR\")" >>lua/config/options.lua

# nvim keymaps
cat >lua/config/keymaps.lua <<EOF
vim.g.mapleader = ' '

local keymap = vim.keymap
-- split windows
keymap.set('n', '<Leader>sv', '<C-w>v')
keymap.set('n', '<Leader>sh', '<C-w>s')
keymap.set('n', '<Leader>se', '<C-w>=')
keymap.set('n', '<Leader>sq', ':close<CR>')
EOF

# nvim theme
cat >lua/plugins/theme.lua <<EOF
return { "EdenEast/nightfox.nvim" }
EOF

# nvim tmux-navigator
cat >lua/plugins/vim-tmux-navigator.lua <<EOF
return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
EOF

# nvim lspsaga
cat >lua/plugins/lspsaga.lua <<EOF
return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
        local keymap = vim.keymap
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- set editor keybinds
        keymap.set('n', 'gf', '<Cmd>Lspsaga lsp_finder<CR>', opts) -- show definition, references
        keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
        keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', opts) -- see definition and make edits in window
        keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
        keymap.set('n', '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts) -- see available code actions
        keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts) -- smart rename
        keymap.set('n', '<leader>D', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts) -- show  diagnostics for line
        keymap.set('n', '<leader>d', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', opts) -- show diagnostics for cursor
        keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
        keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
        keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
        keymap.set('i', '<C-k>', '<C-o><Cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
        keymap.set('n', '<leader>o', '<Cmd>LSoutlineToggle<CR>', opts) -- see outline on right hand side
        keymap.set('n', '<space>f', '<Cmd>lua vim.lsp.buf.format()<CR>', opts)
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
EOF

# nvim lspconfig
cat >lua/plugins/lsp.lua <<EOF
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    setup = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = { "E302", "E501" },
            maxLineLength = 100,
          },
          yapf = { enabled = false },
        },
      },
    },
  },
}
EOF

# nvim-tree
cat >lua/plugins/snacks.lua <<EOF
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {
      -- your explorer configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    picker = {
      sources = {
        explorer = {
          -- your explorer picker configuration comes here
          -- or leave it empty to use the default settings
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
EOF

# fzf icons
cat >lua/plugins/fzf-lua.lua <<EOF
return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {}
}
EOF
popd
