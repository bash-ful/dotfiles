return {
	"andweeb/presence.nvim",
	config = function(_, opts)
		require("presence").setup(opts)
	end,
	opts = {
		auto_update = true,
		neovim_image_text = "neovim",
		show_time = false,
		enable_line_number = true,

		editing_text = "editing %s",
		file_explorer_text = "browsing %s",
		git_commit_text = "committing changes",
		plugin_manager_text = "",
		reading_text = "reading %s",
		line_number_text = "%s:%s",
	},
}
