return {
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				signs = false,
				highlight = {
					keyword = "",
					after = "",
				},
			})
			vim.keymap.set("n", "<leader>pl", ":TodoLocList<CR>", { desc = "Todo Location List" })
			vim.keymap.set("n", "<leader>pq", ":TodoQuickFix<CR>", { desc = "Todo Quick Fix" })
			vim.keymap.set("n", "<leader>pt", ":TodoTrouble<CR>", { desc = "Todo Trouble" })
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}
