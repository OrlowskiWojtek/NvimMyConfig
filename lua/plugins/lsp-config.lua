return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })
            vim.lsp.config("julials", {
                capabilities = capabilities,
                on_new_config = function(new_config, _)
                    local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
                    if require("lspconfig").util.path.is_file(julia) then
                        -- vim.notify("Hello!")
                        new_config.cmd[1] = julia
                    end
                end,
            })

            local util = require("lspconfig.util")
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp" },
                cmd = { "clangd", "--background-index" },
                single_file_support = true,
                root_markers = {
                    ".clangd",
                    ".clang-tidy",
                    ".clang-format",
                    "compile_commands.json",
                    "compile_flags.txt",
                    "configure.ac",
                    ".git"
                },
            })
            vim.lsp.config("fortls", {})
            vim.lsp.config("texlab", {})
            vim.lsp.config("cmake-language-server", {})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
