require'nvim-treesitter.configs'.setup {
  ensure_installed = { "java" }, -- install Java parser
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

