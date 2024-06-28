return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},

				-- enable indentation
				indent = { enable = true },

				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},

				-- A list of parser names, or "all"
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"dockerfile",
					"gitignore",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"rust",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
