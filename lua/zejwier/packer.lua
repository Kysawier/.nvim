local fn = vim.fn

-- Automatucally install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- checks if packer works
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Packer didn't worked")
    return
end

-- run PackerSync after saving this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync 
  augroup end
]])

-- make packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    }
}



return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim' -- makes packer manage itself
    use 'nvim-lua/popup.nvim' -- implementation for the Popup API from vim
    use 'nvim-lua/plenary.nvim' -- useful lua functions used by lots of plugins

    use 'nvim-telescope/telescope.nvim'


    -- Colorschemes
    use 'sainnhe/everforest'

    -- Autocomplition stuff
    use  'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'saadparwaiz1/cmp_luasnip'

    -- snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

--    use 'OmniSharp/omnisharp-vim'

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('nvim-treesitter/playground')

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

--    use {
--        'VonHeikemen/lsp-zero.nvim',
--        branch = 'v2.x',
--        requires = {
            -- LSP Support
--            {'neovim/nvim-lspconfig'},             -- Required
--            {'williamboman/mason.nvim'},           -- Optional
--            {'williamboman/mason-lspconfig.nvim'}, -- Optional

--        }
--    }

--    use('ThePrimeagen/vim-be-good')

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

--    use({
--        "dharmx/nvim-colo",
--        config = function()
--            require("colo").setup()
--        end,
--        requires = {
--           "nvim-lua/plenary.nvim",
--            "nvim-telescope/telescope.nvim",    -- optional
--            "nvim-lua/plenary.nvim",            -- optional
--            "nvim-telescope/telescope.nvim",    -- optional
--            "feline-nvim/feline.nvim",          -- optional
--            "akinsho/bufferline.nvim",          -- optional
--            "lewis6991/gitsigns.nvim",          -- optional
--            "kyazdani42/nvim-web-devicons",     -- optional
--        }
--    })
--
    if PACKER_BOOTSTRAP then
        require('packer').sunc()
    end

end)
