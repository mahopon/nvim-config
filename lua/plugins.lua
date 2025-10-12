-- return require('packer').startup(function(use)
--     use 'wbthomason/packer.nvim'
--     use 'williamboman/mason.nvim'
--    -- use 'mfussenegger/nvim-jdtls'
--     use 'hrsh7th/nvim-cmp'
--     use {
--         'nvim-treesitter/nvim-treesitter', 
--         run = ':TSUpdate',
--         event = { "BufReadPost", "BufNewFile" },
--         config = function()
--             require("treesitter")
--     	end
--     }
--     use 'neovim/nvim-lspconfig'           -- LSP configurations
--     use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
--     use 'hrsh7th/cmp-buffer'              -- Buffer source for completion
--     use 'hrsh7th/cmp-path'                -- Path source for completion
--     use 'L3MON4D3/LuaSnip'                -- Snippet engine
--     use {
--         'folke/tokyonight.nvim',
--         config = function()
--             vim.cmd([[colorscheme tokyonight]])
--         end
--     }
-- end)

require("lazy").setup({
    -- Packer itself is not needed in Lazy
    -- 'wbthomason/packer.nvim',

    'williamboman/mason.nvim',

    -- 'mfussenegger/nvim-jdtls', -- commented in original

    'hrsh7th/nvim-cmp',

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',  -- Packer's `run`
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("treesitter")
        end
    },

    'neovim/nvim-lspconfig',           -- LSP configurations
    'hrsh7th/cmp-nvim-lsp',            -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',              -- Buffer source for completion
    'hrsh7th/cmp-path',                -- Path source for completion
    'L3MON4D3/LuaSnip',                -- Snippet engine
    {
        'folke/tokyonight.nvim',
        lazy = false,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },
      {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  }
})

