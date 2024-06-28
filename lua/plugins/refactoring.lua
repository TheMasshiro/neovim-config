return {
	"theprimeagen/refactoring.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local refactor = require("refactoring")
		refactor.setup({})
		vim.api.nvim_set_keymap(
			"v",
			"<leader>ri",
			[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
			{ noremap = true, silent = true, expr = false }
		)
	end,
}
