return {
    "mason-org/mason-lspconfig.nvim",

    dependencies = {
        {
            "mason-org/mason.nvim",
            opts = {},
        },
        {
            "neovim/nvim-lspconfig",
        },
    },

    config = function()
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

        -- Enable configurations
        vim.lsp.enable({
            "basedpyright",
            "clangd",
            "ansiblels",
        })
    end,
}
