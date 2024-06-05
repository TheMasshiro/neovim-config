return {
	-- LSP setup
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)
		end,
	},

	-- Mason for LSP management
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local lsp_zero = require("lsp-zero")

			require("mason-lspconfig").setup({
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (Optional) configure lua language server
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})
		end,
	},

	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		},
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "rafamadriz/friendly-snippets", "saadparwaiz1/cmp_luasnip" },
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()
			local cmp_format = lsp_zero.cmp_format({ details = true })

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					-- `Enter` key to confirm completion
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					-- Ctrl+Space to trigger completion menu
					["<C-Space>"] = cmp.mapping.complete(),

					-- Navigate between snippet placeholder
					["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),

					-- Scroll up and down in the completion documentation
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),

					-- Navigate between completion
					["<A-j>"] = cmp_action.tab_complete(),
					["<A-k>"] = cmp_action.select_prev_or_fallback(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
				formatting = cmp_format,
			})

			-- Fix C/CPP LSP offset encoding
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			require("lspconfig").clangd.setup({
				on_attach = lsp_zero.on_attach,
				capabilities = cmp_nvim_lsp.default_capabilities(),
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			})
		end,
	},
}
