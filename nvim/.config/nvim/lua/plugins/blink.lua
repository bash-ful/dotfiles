return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	build = "cargo build --release",

	opts = {
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			menu = { border = "single" },
			documentation = {
				auto_show = true,
				window = { border = "single" },
				auto_show_delay_ms = 0,
				update_delay_ms = 50,
			},
			ghost_text = {
				enabled = true,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
