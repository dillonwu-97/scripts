local err_msg = "Failed to load the module %s" 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local test = false
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({

    -- nvim tree
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function ()
            require("nvim-tree").setup({})
        end
    },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-telescope/telescope-media-files.nvim',
            'nvim-lua/plenary.nvim'
        }
    },
    {
        "folke/tokyonight.nvim"
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts={}, -- equivalent to setup({}) function
    },

    --Completion plugins
    {
        'hrsh7th/nvim-cmp',
        lazy=true,
        event={"InsertEnter", "CmdlineEnter"},
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'jose-elias-alvarez/null-ls.nvim'
        },
    },

    -- LSP 
    {
        'neovim/nvim-lspconfig'
    },
    {
        'williamboman/mason.nvim'
    },
    {
        'williamboman/mason-lspconfig.nvim'
    },
    {
        'jose-elias-alvarez/null-ls.nvim'
    },
    {
        'pmizio/typescript-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'neovnim/nvim-lspconfig',
        },
        lazy=true
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter'
    },

    -- Commenting
    {
        'numToStr/Comment.nvim',
        opts={
        },
        lazy=false
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function ()
            require('ts_context_commentstring').setup({})
        end
    },

    {
        'petRUShka/vim-sage'
    },
    {
        'akinsho/bufferline.nvim',
        version='*',
        dependencies='nvim-tree/nvim-web-devicons'
    },

    -- toggleterm
    {
        'akinsho/toggleterm.nvim'
    }
})
