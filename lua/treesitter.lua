require'nvim-treesitter.configs'.setup {
    ensure_installed = { "java", "python" }, -- install Java parser
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    auto_install = true,
}

