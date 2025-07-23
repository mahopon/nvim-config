local jdtls = require('jdtls')
local root_markers = {'.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'}
local root_dir = require('jdtls.setup').find_root(root_markers)
local lspconfig = require('lspconfig')

if not root_dir then
  print("No root dir found, skipping jdtls")
  return
end

local home = os.getenv("HOME")
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local launcher = vim.fn.glob(home .. '/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_*.jar')
local lombok_path = vim.fn.expand("~/.local/share/lombok/lombok.jar")

local config = {
  cmd = {
    'java',
    '-javaagent:' .. lombok_path,
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', launcher,
    '-configuration', home .. '/.local/share/nvim/lsp_servers/jdtls/config_linux',
    '-data', workspace_dir
  },
  root_dir = root_dir,
  init_options = {
    extendedClientCapabilities = jdtls.extendedClientCapabilities,
  },
  settings = {
    java = {
      saveActions = {
        organizeImports = true
      }
    }
  },
  on_attach = function(client, bufnr)
    -- Organize imports on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local results = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
        for _, res in pairs(results or {}) do
          for _, action in pairs(res.result or {}) do
            if action.edit then
              vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
            else
              vim.lsp.buf.execute_command(action.command)
            end
          end
        end
      end,
    })

    -- Keymap for manual code actions
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
  end,
}

jdtls.start_or_attach(config)
