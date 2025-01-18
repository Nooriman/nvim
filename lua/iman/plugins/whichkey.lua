local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  -- key_labels = {
  -- override the label used to display some keys. It doesn't effect WK in any other way.
  -- For example:
  -- ["<space>"] = "SPC",
  -- ["<cr>"] = "RET",
  -- ["<tab>"] = "TAB",
  -- },
  icons = {
    mappings = false,
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  -- popup_mappings = {
  -- 	scroll_down = "<c-d>", -- binding to scroll down inside the popup
  -- 	scroll_up = "<c-u>", -- binding to scroll up inside the popup
  -- },
  -- window = {
  -- 	border = "rounded", -- none, single, double, shadow
  -- 	position = "bottom", -- bottom, top
  -- 	margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
  -- 	padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  -- 	winblend = 0,
  -- },
  layout = {
    -- height = { min = 6, max = 25 }, -- min and max height of the columns
    -- width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3,     -- spacing between columns
    align = "right", -- align columns left, center or right
  },
  -- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  -- triggers_blacklist = {
  -- list of mode / prefixes that should never be hooked by WhichKey
  -- this is mostly relevant for key maps that start with a native binding
  -- most people should not need to change this
  -- 	i = { "j", "k" },
  -- 	v = { "j", "k" },
  -- },
}

-- MAPPING
which_key.add({

  -- BUFFERS
  {
    "<leader>B",
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    desc = "Buffers",
    nowait = true,
    remap = false,
  },
  { "<leader>b",  group = "Buffer",                         nowait = true,         remap = false },
  { "<leader>bc", "<cmd>BufferLinePickClose<cr>",           desc = "Close",        nowait = true, remap = false },
  { "<leader>bn", "<cmd>BufferLineCycleNext<cr>",           desc = "Next",         nowait = true, remap = false },
  { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>",           desc = "Prev",         nowait = true, remap = false },
  { "<leader>c",  "<cmd>Bdelete!<CR>",                      desc = "Close Buffer", nowait = true, remap = false },

  -- FUZZY FINDER
  {"<leader>f", group = "Fuzzy Find", nowait = true, remap = false},
  { "<leader>fl",  "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text",    nowait = true, remap = false },

  -- GIT
  { "<leader>g",  group = "Git",                            nowait = true,         remap = false },
  {
    "<leader>gR",
    "<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
    desc = "Reset Buffer",
    nowait = true,
    remap = false,
  },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>",              desc = "Checkout branch",   nowait = true, remap = false },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>",               desc = "Checkout commit",   nowait = true, remap = false },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>",              desc = "Diff",              nowait = true, remap = false },
  { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>",               desc = "Lazygit",           nowait = true, remap = false },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>",  desc = "Next Hunk",         nowait = true, remap = false },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",  desc = "Prev Hunk",         nowait = true, remap = false },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame",             nowait = true, remap = false },
  { "<leader>go", "<cmd>Telescope git_status<cr>",                desc = "Open changed file", nowait = true, remap = false },
  {
    "<leader>gp",
    "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
    desc = "Preview Hunk",
    nowait = true,
    remap = false,
  },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
  {
    "<leader>gu",
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    desc = "Undo Stage Hunk",
    nowait = true,
    remap = false,
  },

  -- LSP
  { "<leader>l",  group = "LSP",         nowait = true,           remap = false },
  { "<leader>lI", "<cmd>Mason<cr>",      desc = "Installer Info", nowait = true, remap = false },
  {
    "<leader>lS",
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    desc = "Workspace Symbols",
    nowait = true,
    remap = false,
  },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",      desc = "Code Action", nowait = true, remap = false },
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format",      nowait = true, remap = false },
  { "<leader>li", "<cmd>LspInfo<cr>",                            desc = "Info",        nowait = true, remap = false },

  -- LSP DIAGNOSTIC
  {
    "<leader>ld",
    "<cmd>Telescope diagnostics bufnr=0<cr>",
    desc = "Document Diagnostics",
    nowait = true,
    remap = false,
  },
  {
    "<leader>lj",
    "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
    desc = "Next Diagnostic",
    nowait = true,
    remap = false,
  },
  {
    "<leader>lk",
    "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
    desc = "Prev Diagnostic",
    nowait = true,
    remap = false,
  },

  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>",      desc = "CodeLens Action", nowait = true, remap = false },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix",        nowait = true, remap = false },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",        desc = "Rename",          nowait = true, remap = false },
  {
    "<leader>ls",
    "<cmd>Telescope lsp_document_symbols<cr>",
    desc = "Document Symbols",
    nowait = true,
    remap = false,
  },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>",      desc = "Workspace Diagnostics", nowait = true, remap = false },

  -- PACKER
  { "<leader>p",  group = "Packer",                      nowait = true,                  remap = false },
  { "<leader>pS", "<cmd>PackerStatus<cr>",               desc = "Status",                nowait = true, remap = false },
  { "<leader>pc", "<cmd>PackerCompile<cr>",              desc = "Compile",               nowait = true, remap = false },
  { "<leader>pi", "<cmd>PackerInstall<cr>",              desc = "Install",               nowait = true, remap = false },
  { "<leader>ps", "<cmd>PackerSync<cr>",                 desc = "Sync",                  nowait = true, remap = false },
  { "<leader>pu", "<cmd>PackerUpdate<cr>",               desc = "Update",                nowait = true, remap = false },
  { "<leader>q",  "<cmd>q!<CR>",                         desc = "Quit",                  nowait = true, remap = false },

  -- TELESCOPE SEARCH
  { "<leader>s",  group = "Search",                      nowait = true,                  remap = false },
  { "<leader>sC", "<cmd>Telescope commands<cr>",         desc = "Commands",              nowait = true, remap = false },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>",        desc = "Man Pages",             nowait = true, remap = false },
  { "<leader>sR", "<cmd>Telescope registers<cr>",        desc = "Registers",             nowait = true, remap = false },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>",      desc = "Colorscheme",           nowait = true, remap = false },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>",          desc = "Keymaps",               nowait = true, remap = false },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>",         desc = "Open Recent File",      nowait = true, remap = false },
  { "<leader>st", "<cmd>Telescope help_tags<cr>",        desc = "Find Help",             nowait = true, remap = false },

  -- TERMINAL
  { "<leader>t",  group = "Terminal",                    nowait = true,                  remap = false },
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float",                 nowait = true, remap = false },
  {
    "<leader>th",
    "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
    desc = "Horizontal",
    nowait = true,
    remap = false,
  },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },
  { "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>",                    desc = "Node",     nowait = true, remap = false },
  { "<leader>tp", "<cmd>lua`_PYTHON_TOGGLE()<cr>",                  desc = "Python",   nowait = true, remap = false },
  { "<leader>tt", "<cmd>lua _HTOP_TOGGLE()<cr>",                    desc = "Htop",     nowait = true, remap = false },
  { "<leader>tu", "<cmd>lua _NCDU_TOGGLE()<cr>",                    desc = "NCDU",     nowait = true, remap = false },

  -- OTHERS
  {"<leader>h", "<cmd>:nohl<CR>",                                   desc = "No Highlight", nowait = true, remap = false},
  { "<leader>w",  "<cmd>w!<CR>",                                    desc = "Save",     nowait = true, remap = false },
  -- { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                desc = "Explorer",     nowait = true, remap = false },
})

which_key.setup(setup)
