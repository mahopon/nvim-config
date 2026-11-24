return {
    "petertriho/nvim-scrollbar",
    lazy = false,
    opts = {
        exclude = {
            filetypes = { "neo-tree", "barbar" },
        },
        scrollbar = {
            preset = "vscode"
        },
        minimap = {
            enabled = true,
            preset = "vscode",
        },
        providers = {
            -- search = { incsearch = true },
            -- marks = { numbers = true },
            -- mini_diff = true
            gitsigns = true,
            treesitter = true
        },
    },
}
