require("config.lazy")
require("binds")
vim.cmd[[colorscheme tokyonight-night]]
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)

    if not vim.treesitter.language.add(lang) then
      local available = vim.g.ts_available
        or require("nvim-treesitter").get_available()
      if not vim.g.ts_available then
        vim.g.ts_available = available
      end
      if vim.tbl_contains(available, lang) then
        require("nvim-treesitter").install(lang)
      end
    end

    if vim.treesitter.language.add(lang) then
      vim.treesitter.start(args.buf, lang)
      -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      -- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
      -- vim.wo[0][0].foldmethod = "expr"
    end
  end,
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 4     -- Number of spaces for each indentation level
vim.opt.tabstop = 4        -- Number of spaces a tab character represents
vim.opt.softtabstop = 4    -- Number of spaces the tab key inserts
vim.opt.wrap = true
vim.opt.linebreak = true
