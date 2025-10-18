local lspconfig = require('lspconfig')

lspconfig.solidity_ls_nomicfoundation.setup {
  cmd = { "solidity-language-server", "--stdio" },
  filetypes = { "solidity" },
  root_dir = lspconfig.util.root_pattern("hardhat.config.*", "foundry.toml", ".git"),
  single_file_support = true,

  -- Optional: you can customize settings
  settings = {
    solidity = {
      includePath = "",
      remapping = {
        ["@OpenZeppelin/"] = "node_modules/@OpenZeppelin/",
      },
    },
  },
}
