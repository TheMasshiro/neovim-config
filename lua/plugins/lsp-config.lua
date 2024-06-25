return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", opts = { ui = {
				border = "rounded",
			} } },
			{ "williamboman/mason-lspconfig.nvim", opts = {
				automatic_installation = true,
			} },
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local mason_tool_installer = require("mason-tool-installer")

			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			mason_lspconfig.setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					vim.keymap.set(
						"n",
						"<leader>li",
						vim.lsp.buf.implementation,
						{ buffer = event.buf, desc = "Go to Implementation" }
					)
					vim.keymap.set(
						"n",
						"<leader>lr",
						vim.lsp.buf.references,
						{ buffer = event.buf, desc = "Show References" }
					)
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename" })
					vim.keymap.set(
						"n",
						"<leader>ca",
						vim.lsp.buf.code_action,
						{ buffer = event.buf, desc = "Code Actions" }
					)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "Hover Snippet" })
					vim.keymap.set(
						"n",
						"<leader>gd",
						vim.lsp.buf.definition,
						{ buffer = event.buf, desc = "Go to Definition" }
					)
					vim.keymap.set(
						"n",
						"<leader>D",
						vim.lsp.buf.declaration,
						{ buffer = event.buf, desc = "Go to Declaration" }
					)
				end,
			})

			mason_lspconfig.setup({
				ensure_installed = {
					-- LSP
					"clangd",
					"pyright",
					"tsserver",
					"html",
					"cssls",
					"jsonls",
					"marksman",
					"lua_ls",
					"emmet_language_server",
					"rust_analyzer",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					-- Linter
					"checkstyle",
					"cpplint",
					"eslint_d",
					"flake8",
					"golangci-lint",

					-- Formatter
					"black",
					"clang-format",
					"prettier",
					"prettierd",
					"stylua",
				},
			})
		end,
	},
}
