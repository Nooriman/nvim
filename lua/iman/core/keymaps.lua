vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps

-- NORMAL MODE
keymap.set("n", "<leader>nh", ":nohl<CR>") -- remove seach highlight
keymap.set("n", "x", "_x") -- delete a character but not going to copy to register

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next --[[ tab ]]
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to prev tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>k", "<Esc>:m .-2<CR>==gi")
keymap.set("n", "<leader>l", ":BufferLineCycleNext<CR>") -- go to next tab
keymap.set("n", "<leader>h", ":BufferLineCyclePrev<CR>") -- go to next tab

-- INSERT MODE
keymap.set("i", "jk", "<ESC>")

-- PLUGIN KEYMAPS
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
