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
			vim.keymap.set("n", "<leader>pt", ":TodoTelescope<CR>", { desc = "Open Todo-Comments" })
		end,
	},
}
