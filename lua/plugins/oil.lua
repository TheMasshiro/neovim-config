return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup()
		vim.keymap.set("n", "<leader>pv", oil.toggle_float, { desc = "Open Parent Directory" })
	end,
}
