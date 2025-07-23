-- Require lspconfig
local lspconfig = require('lspconfig')

-- Optional: Include capabilities for autocompletion (if using nvim-cmp)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup gopls
return lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Example: format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end,
})


