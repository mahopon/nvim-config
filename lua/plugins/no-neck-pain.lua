return {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
        -- Pass the configuration directly to the opts table
        buffers = {
            scratchPad = {
                enabled = true,
                -- Creates a directory named 'no-neck-pain' inside your Neovim state directory
                -- (e.g., ~/.local/state/nvim/no-neck-pain/ on Linux/macOS)
                location = vim.fn.stdpath("state") .. "/no-neck-pain/",
            },
            -- This sets the side buffers to Markdown so you get nice syntax highlighting
            bo = {
                filetype = "md",
            },
        },
    },
    config = function(_, opts)

        local notes_dir = opts.buffers.scratchPad.location
        if vim.fn.isdirectory(notes_dir) == 0 then
            vim.fn.mkdir(notes_dir, "p")
        end
        -- Initialize the plugin with the opts defined above
        require("no-neck-pain").setup(opts)

        -- Trigger NoNeckPain when Neovim enters
    --     vim.api.nvim_create_autocmd("VimEnter", {
    --         callback = function()
    --             vim.cmd("NoNeckPain")
    --         end,
    --     })
    end,
}
