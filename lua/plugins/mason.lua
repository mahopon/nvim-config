return {
    "mason-org/mason-lspconfig.nvim",

    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {
                -- Tools (not LSP servers) to always install.
                ensure_installed = {
                    "ansible-lint",
                    "black",
                    "htmlhint",
                },
            },
        },
        {
            "neovim/nvim-lspconfig",
        },
    },

    opts = {
        -- LSP servers to always install, by lspconfig/server name.
        ensure_installed = {
            "ansiblels",             -- ansible-language-server
            "basedpyright",
            "clangd",
            "emmet_language_server", -- emmet-language-server
            "gopls",
            "html",                  -- html-lsp
            "lua_ls",                -- lua-language-server
            "pylsp",                 -- python-lsp-server
            "ruff",
            "terraformls",           -- terraform-ls
            "vtsls",
        },

        -- Enable every installed server, except ones we intentionally skip.
        automatic_enable = {
            exclude = {
                "ts_ls", -- using vtsls instead
                "pylsp", -- using basedpyright instead
                "jdtls", -- using IntelliJ instead
            },
        },
    },

    config = function(_, opts)
        require("mason-lspconfig").setup(opts)

        -- BasedPyright
        vim.lsp.config("basedpyright", {
            settings = {
                basedpyright = {
                    typeCheckingMode = "basic",
                },
            },
        })

        -- Clangd
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--background-index",
                "--query-driver=/Users/mahopon/.platformio/packages/toolchain-xtensa-esp32s3/bin/xtensa-esp32s3-elf-g++",
            },

            reuse_client = function(client, config)
                return true
            end,
        })

        -- Ansible
        vim.lsp.config("ansiblels", {
            filetypes = { "yaml.ansible" },
            settings = {
                ansible = {
                    path = "ansible",
                    python = {
                        interpreterPath = "python3",
                    },
                    validation = {
                        enabled = true,
                        lint = {
                            enabled = true,
                            path = "ansible-lint",
                        },
                    },
                },
            },
        })

        -- Ansible filetype detection
        vim.filetype.add({
            pattern = {
                [".*/playbooks/.*%.yml"] = "yaml.ansible",
                [".*/playbooks/.*%.yaml"] = "yaml.ansible",
                [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
                [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
                [".*/roles/.*/defaults/.*%.ya?ml"] = "yaml.ansible",
                [".*/roles/.*/vars/.*%.ya?ml"] = "yaml.ansible",
                [".*/roles/.*/meta/.*%.ya?ml"] = "yaml.ansible",
            },
        })

        -- Servers are enabled automatically by mason-lspconfig; see
        -- `automatic_enable.exclude` above.
    end,
}
