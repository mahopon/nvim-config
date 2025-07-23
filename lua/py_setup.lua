local nvim_lsp = require('lspconfig')

nvim_lsp.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {enabled = true, maxLineLength = 100},
        pylsp_mypy = {enabled = true},
        pylsp_black = {enabled = true},
        pylsp_isort = {enabled = true},
      }
    }
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
}


-- Attach on_attach callback to pylsp setup
return nvim_lsp.pylsp.setup{
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {enabled = true, maxLineLength = 100},
        pylsp_mypy = {enabled = true},
        pylsp_black = {enabled = true},
        pylsp_isort = {enabled = true},
      }
    }
  },
}


