return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				yuck = { "cljfmt" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				scss = { "prettierd", "prettier" },
				js = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				jsonc = { "prettierd", "prettier" },
				ts = { "prettierd", "prettier" },
				c = { "clang-format" },
				py = { "ruff_format" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			notify_no_formatters = true,
		},
	},
}
