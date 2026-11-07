return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	"nvim-tree/nvim-web-devicons",
    },
    opts = {
        defaults = {
            initial_mode = "insert"
        }
    },
    init = function()
        -- Neovim 0.12 clamps the cursor one column back at the end of the
        -- prompt line when something triggers a redraw (e.g. reactive.nvim),
        -- because the prompt has a right-align virtual-text extmark (the
        -- result counter). This makes typed characters appear out of order
        -- (e.g. "abc" -> "bca"). virtualedit=all prevents the clamping.
        -- See https://github.com/folke/snacks.nvim/issues/2810
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "TelescopePrompt",
            callback = function()
                vim.wo.virtualedit = "all"
            end,
        })
    end,
}
