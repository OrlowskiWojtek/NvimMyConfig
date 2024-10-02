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

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.julials.setup({
				capabilities = capabilities,
				on_new_config = function(new_config, _)
					local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
					if require("lspconfig").util.path.is_file(julia) then
						-- vim.notify("Hello!")
						new_config.cmd[1] = julia
					end
				end,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
				filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp" },
				cmd = { "clangd", "--background-index" },
				single_file_support = true,
				root_dir = lspconfig.util.root_pattern(
					".clangd",
					".clang-tidy",
					".clang-format",
					"compile_commands.json",
					"compile_flags.txt",
					"configure.ac",
					".git"
				),
			})
			lspconfig.tsserver.setup({
                filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "typescript-language-server", "--stdio" },
			})

            lspconfig.tailwindcss.setup{}

            lspconfig.texlab.setup{}

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
