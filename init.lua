-- ~/.config/nvim/init.lua

-- 1. Bootstrap packer.nvim plugin manager (if you don't have it)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.cmd('packadd packer.nvim')
end

-- Plugins setup & Vim settings
require("plugins")
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.opt.wrap = true
vim.o.number = true

-- Keybindings
vim.api.nvim_set_keymap('n', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', 'j', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true } )
-- 3. Setup nvim-cmp (autocomplete)
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }
})


-- 5. Optional: key mappings for LSP features
local on_attach = function(client, bufnr)
  local bufmap = function(lhs, rhs, desc)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, { noremap=true, silent=true, desc=desc })
  end

  bufmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to Definition')
  bufmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover Info')
  bufmap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', 'References')
  bufmap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename')
  bufmap('<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action')
  bufmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Previous Diagnostic')
  bufmap(']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next Diagnostic')
end


-- LSP files
require('jsts_setup')
require('py_setup')
require('go_setup')
require('clang_setup')

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    require("java_setup")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.java", "*.py" },
  callback = function()
      vim.lsp.buf.format({ async = false })
      print("Organizing imports before save...")
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
