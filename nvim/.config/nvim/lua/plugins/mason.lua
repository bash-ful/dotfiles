return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = { "lua_ls", "clangd", "biome", "ruff" },
			},
		},
	},
	opts = {
		servers = {
			lua_ls = {},
			gopls = {},
			clangd = {},
			ruff = {},
			ts_ls = {},
			rust_analyzer = { check_on_save = false },
			intelephense = {
				check_on_save = false,
				root_dir = function(_)
					return vim.loop.cwd()
				end,
			},
		},
	},

	config = function(_, opts)
		-- If you want, merge blink capabilities *once*
		local blink_caps = require("blink.cmp").get_lsp_capabilities()

		for server, cfg in pairs(opts.servers) do
			-- Merge default + user config
			vim.lsp.config(
				server,
				vim.tbl_deep_extend("force", {
					capabilities = blink_caps,
				}, cfg)
			)
		end

		-- After registering all servers configs, enable them
		vim.lsp.enable(vim.tbl_keys(opts.servers))
	end,
}
