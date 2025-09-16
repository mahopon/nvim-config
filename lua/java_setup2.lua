require("java").setup({
  root_markers = {"pom.xml", "build.gradle", ".git"},
  jdtls = {
    version = "1.43.0", -- pin jdtls version
  },
  java_test = {
    enable = true,
    version = "0.40.1",
  },
  java_debug_adapter = {
    enable = true,
    version = "0.58.1",
  },
  jdk = {
    auto_install = true,
    version = "17.0.2",
  },
})
require("lspconfig").jdtls.setup({})
