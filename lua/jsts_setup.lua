local lspconfig = require("lspconfig")

return lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    -- Optional: Disable tsserver formatting if you use prettier or eslint
    client.server_capabilities.documentFormattingProvider = false
  end,
})
