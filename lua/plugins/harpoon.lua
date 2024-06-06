return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add Buffer to Harpoon" })
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon Quick Menu" })

		vim.keymap.set("n", "<C-h>", function()
			ui.nav_file(1)
		end, { desc = "Buffer 1" })
		vim.keymap.set("n", "<C-t>", function()
			ui.nav_file(2)
		end, { desc = "Buffer 2" })
		vim.keymap.set("n", "<C-n>", function()
			ui.nav_file(3)
		end, { desc = "Buffer 3" })
		vim.keymap.set("n", "<C-s>", function()
			ui.nav_file(4)
		end, { desc = "Buffer 4" })
	end,
}
