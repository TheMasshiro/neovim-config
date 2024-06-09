return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>ma", mark.add_file, { desc = "Add Buffer to Harpoon" })
		vim.keymap.set("n", "<leader>mq", ui.toggle_quick_menu, { desc = "Harpoon Quick Menu" })

		vim.keymap.set("n", "<leader>m1", function()
			ui.nav_file(1)
		end, { desc = "Harpoon Buffer 1" })
		vim.keymap.set("n", "<leader>m2", function()
			ui.nav_file(2)
		end, { desc = "Harpoon Buffer 2" })
		vim.keymap.set("n", "<leader>m3", function()
			ui.nav_file(3)
		end, { desc = "Harpoon Buffer 3" })
		vim.keymap.set("n", "<leader>m4", function()
			ui.nav_file(4)
		end, { desc = "Harpoon Buffer 4" })
	end,
}
