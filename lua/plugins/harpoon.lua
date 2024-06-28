return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>qq", function()
			harpoon:list():add()
		end, { desc = "Add Buffer to Harpoon" })
		vim.keymap.set("n", "<leader>qw", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Quick Menu" })

		vim.keymap.set("n", "<leader>q1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon Buffer 1" })
		vim.keymap.set("n", "<leader>q2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon Buffer 2" })
		vim.keymap.set("n", "<leader>q3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon Buffer 3" })
		vim.keymap.set("n", "<leader>q4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon Buffer 4" })
	end,
}
