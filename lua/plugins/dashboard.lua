return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "number",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Find Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " File Manager",
						group = "Number",
						action = "Oil --float",
						key = "v",
					},
				},
				mru = { limit = 5 },
				footer = {},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
