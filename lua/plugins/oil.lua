return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			keymaps = {
				["<Esc>"] = { callback = "actions.close", mode = "n" },
			},
		})
		vim.keymap.set("n", "<leader>pv", oil.toggle_float, { desc = "Open Parent Directory" })
	end,
}
