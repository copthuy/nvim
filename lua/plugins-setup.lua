-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
    print('Packer is not imported!')
    return
end

-- add list of plugins to install
return packer.startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- file explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons'
        },
    }

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
    }

    -- my prefered colorscheme
    use 'neanias/everforest-nvim'
    use 'nvim-lualine/lualine.nvim'

    -- code editing
    use 'numToStr/Comment.nvim'
    use 'tpope/vim-surround'
    
    -- Highlight, edit, and navigate code
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    -- Additional text objects via treesitter
    use { 
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    -- Autoclose tags
    use {
        'windwp/nvim-ts-autotag',
        after = "nvim-treesitter",
    }
    use 'windwp/nvim-autopairs'
    use 'onsails/lspkind.nvim'

    -- autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip' -- snippet engine 
    use 'rafamadriz/friendly-snippets'

    -- lsp config
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',

            -- Formatting & linting
            'jose-elias-alvarez/null-ls.nvim',
            'jayp0521/mason-null-ls.nvim',
        },
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
