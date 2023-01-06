local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'nanozuki/tabby.nvim'

    use 'christoomey/vim-tmux-navigator'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'numToStr/Comment.nvim'

    use 'nvim-lua/plenary.nvim'

    use { 'nvim-telescope/telescope-fzf-native.nvim', run='make' }
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'nvim-tree/nvim-tree.lua'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use { 'glepnir/lspsaga.nvim', branch='main' }
    use 'onsails/lspkind.nvim'

    use 'jose-elias-alvarez/null-ls.nvim'
    use 'jayp0521/mason-null-ls.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
    }

    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'lewis6991/gitsigns.nvim'

    use 'nvim-lualine/lualine.nvim'
    use 'nvim-tree/nvim-web-devicons'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
