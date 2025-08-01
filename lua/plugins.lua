return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'mfussenegger/nvim-jdtls'
    use 'hrsh7th/nvim-cmp'
    use {
        'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate',
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("treesitter")
    	end
    }
    use 'neovim/nvim-lspconfig'           -- LSP configurations
    use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'              -- Buffer source for completion
    use 'hrsh7th/cmp-path'                -- Path source for completion
    use 'L3MON4D3/LuaSnip'                -- Snippet engine
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    }
end)
