return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		-- fzf.setup({})
		vim.keymap.set("n", "<leader>pf", fzf.files, { desc = "Find Files", silent = true })
		vim.keymap.set("n", "<leader>pg", fzf.git_files, { desc = "Git Files", silent = true })
		vim.keymap.set("n", "<leader>ps", fzf.live_grep, { desc = "Grep Search", silent = true })
	end,
}
