-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

-- Automatucally install packer

vim.cmd [[packadd packer.nvim]]

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

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('nvim-treesitter/playground')

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use('ThePrimeagen/vim-be-good')

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
end)
