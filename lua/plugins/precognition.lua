return {
	"tris203/precognition.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		vim.keymap.set("n", "<leader>A", function()
			require("precognition").toggle()
		end, { desc = "Show Vim Motions" })
	end,
}
