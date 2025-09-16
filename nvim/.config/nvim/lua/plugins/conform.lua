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
				ts = { "prettierd", "prettier" },
			},
		},
	},
}
