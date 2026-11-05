return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },

    lazy = false,

    opts = {
      close_if_last_window = false,
      window = {
        position = "left",
        width = 30,
      },
    },

    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "neo-tree",
        callback = function()
            local win = vim.fn.bufwinid(vim.fn.bufnr())
            if win ~= -1 then
                vim.wo[win].number = true
                vim.wo[win].relativenumber = false
            end
        end,
    })
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            vim.schedule(function()
                require("neo-tree.command").execute({
                    action = "show",
                    source = "filesystem",
                    position = "left",
                })

                -- Refresh Barbar's layout after Neo-tree opens
                vim.schedule(function()
                    vim.cmd("redrawtabline")
                end)
            end)
        end,
    })
    end,
  },
}
