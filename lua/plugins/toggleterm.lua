return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
          size = 20,
          open_mapping = [[<c-\>]],
          direction = "float",
          shade_terminals = true,
          persist_size = true,
          persist_mode = true,
        })
    end
}
