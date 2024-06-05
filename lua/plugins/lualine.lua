return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			dark = "#191A21",
			light = "#ABB2BF",
		}

		local custom = {
			normal = {
				a = { bg = colors.dark, fg = colors.light, gui = "bold" },
				b = { bg = colors.dark, fg = colors.light },
				c = { bg = colors.dark, fg = colors.light },
			},
			insert = { a = { fg = colors.light, bg = colors.dark } },
			visual = { a = { fg = colors.light, bg = colors.dark } },
			replace = { a = { fg = colors.light, bg = colors.dark } },
			command = { a = { fg = colors.light, bg = colors.dark } },
			inactive = { a = { fg = colors.light, bg = colors.dark } },
		}

		local lualine = require("lualine")

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = custom,
				component_separators = "",
				section_separators = "",
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
