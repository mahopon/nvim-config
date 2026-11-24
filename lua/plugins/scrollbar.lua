return {
    "petertriho/nvim-scrollbar",
    lazy = false,
    opts = {
         providers = {
        search = { incsearch = true },
        marks = { numbers = true },
    },
    scrollbar = {
        preset = "zed",
        autohide = true,
    }
    },
}
