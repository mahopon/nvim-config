return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
          size = 20,
          direction = "float",
          shade_terminals = true,
          persist_size = true,
          persist_mode = true,
        })

        vim.keymap.set({'n', 't'}, '<C-\\>', '<Cmd>1ToggleTerm direction=float<CR>')
        vim.keymap.set({'n', 't'}, '<A-\\>', '<Cmd>2ToggleTerm direction=horizontal<CR>')
    end
}
