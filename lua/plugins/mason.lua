return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        {
            "neovim/nvim-lspconfig",
            config = function()
                vim.lsp.config["basedpyright"] = {
                    settings = {
                        basedpyright = {
                            typeCheckingMode = "basic",
                        },
                    },
                }

                vim.lsp.config["ansiblels"] = {
                    filetypes = { "yaml.ansible" },
                    settings = {
                        ansible = {
                            path = "ansible",
                            python = {
                                interpreterPath = "python3",
                            },
                            validation = {        -- moved inside ansible {}
                                enabled = true,
                                lint = {
                                    enabled = true,
                                    path = "ansible-lint",
                                },
                            },
                        },
                    },
                }

                vim.filetype.add({
                    pattern = {
                        -- playbooks
                        [".*/playbooks/.*%.yml"]  = "yaml.ansible",
                        [".*/playbooks/.*%.yaml"] = "yaml.ansible",
                        -- roles
                        [".*/roles/.*/tasks/.*%.ya?ml"]    = "yaml.ansible",
                        [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
                        [".*/roles/.*/defaults/.*%.ya?ml"] = "yaml.ansible",
                        [".*/roles/.*/vars/.*%.ya?ml"]     = "yaml.ansible",
                    },
                })
            end,
        },
    },
}
