return {

	{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				-- Conform will run multiple formatters sequentially
				lua = { "stylua" },
				python = { "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				-- Use a sub-list to run only the first available formatter
			},
			format_on_save = { timeout_ms = 2500, lsp_fallback = true },
			notify_on_error = false,
		},
	},
}
