require('possession').setup {
require('possession').setup {
  session_dir = vim.fn.stdpath('data') .. '/sessions', -- Default session directory
  silent = false, -- Show output when saving/loading
  load_silent = true, -- Suppress session loading output
  autosave = {
    current = true, -- Automatically save the current session
    tmp = false, -- Disable autosaving temporary sessions
    on_load = true, -- Save before loading a new session
    on_quit = true, -- Save before quitting Neovim
  },
  hooks = {
    before_save = function(name) return {} end,
    after_save = function(name, user_data, aborted) end,
    before_load = function(name, user_data) return user_data end,
    after_load = function(name, user_data) end,
  }
}
}
