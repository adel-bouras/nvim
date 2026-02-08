return {
	-- Add lazydev for better Neovim Lua development
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	-- Optional: add type definitions for vim.uv
	{ "Bilal2453/luvit-meta", lazy = true },

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
		end,
	},
}
