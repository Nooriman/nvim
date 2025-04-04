local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
    file_ignore_patterns = {"node_modules/"},
	},
	-- pickers = {
	-- 	find_files = {
	-- 		-- theme = "dropdown",
	-- 		cwd = "~/Documents/Dev/",
	-- 	},
	-- },
})

telescope.load_extension("fzf")
