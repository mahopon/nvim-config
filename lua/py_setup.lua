local nvim_lsp = require('lspconfig')

nvim_lsp.ruff.setup({
    on_attach = function(client, bufnr)

    end,
    init_options = {
        settings = {
            args = {},
        }
    }
})

-- Attach on_attach callback to pylsp setup
nvim_lsp.pylsp.setup{
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {enabled = true, maxLineLength = 100},
        pylsp_mypy = {enabled = true, live_mode = true},
        pylsp_black = {enabled = true},
        pylsp_isort = {enabled = true},
        jedi_completion = {enabled = true},
      }
    }
  },
}


