return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", telescope.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<C-p>", telescope.git_files, { desc = "Git Files" })
			vim.keymap.set("n", "<leader>ps", function()
				telescope.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "Grep String" })
			vim.keymap.set("n", "<leader>vh", telescope.help_tags, { desc = "Help Tags" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
