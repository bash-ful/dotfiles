return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	opts = {
		ensure_installed = { "python", "bash", "lua", "c", "gitcommit", "gitignore" },
		highlight = { enable = true },
		indent = { enable = true },
	},
}
