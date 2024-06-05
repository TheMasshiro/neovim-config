return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			{ "williamboman/mason-lspconfig.nvim", opts = {
				automatic_install = true,
			} },
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lsp = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lsp.lua_ls.setup({
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, {})
					vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {})
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
					vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, { buffer = ev.buf })
				end,
			})
		end,
	},
}
