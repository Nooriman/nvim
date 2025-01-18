local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
	callback = function()
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
	group = vim.api.nvim_create_augroup("OPEN_FOLDS", {}),
	callback = function() end,
})

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
	},
})
