-- for formating
return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				objc = { "clang_format" },
			},
			format_on_save = {
				--timeout_ms = 3000,
				lsp_fallback = true,
			},
		})
	end,
}
