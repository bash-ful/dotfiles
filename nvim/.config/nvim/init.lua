require("config.lazy")
vim.g.mapleader = " "
vim.opt.expandtab = false
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float()
end)
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.code_action()
end)
vim.diagnostic.config({
	virtual_text = true,
	update_in_insert = true,
})
