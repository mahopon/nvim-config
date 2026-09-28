return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
          exclude_groups = {
            "NormalFloat",
            "FloatBorder",
          },
        })
        vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })
        -- Force transparency on at startup (same as running :TransparentEnable)
        require("transparent").toggle(true)
    end
}
