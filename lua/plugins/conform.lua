return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
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

			format_on_save = {
				-- These options will be passed to conform.format()
				lsp_fallback = true,
				async = false,
				timeout_ms = 4000,
			},
		})
	end,
}
