return {

	{ "folke/lazydev.nvim", ft = "lua", opts = {} },
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
				markdown = { "prettierd", "prettier" },
			},
			format_on_save = { timeout_ms = 2500, lsp_fallback = true },
			notify_on_error = false,
		},
	},
}
