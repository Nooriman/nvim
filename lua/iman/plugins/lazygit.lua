local M = {}

-- Check if lazygit is installed
local function check_lazygit()
  if vim.fn.executable("lazygit") == 0 then
    vim.notify("Lazygit is not installed. Please install it to use this feature.", vim.log.levels.ERROR)
    return false
  end
  return true
end

-- Open lazygit in a floating terminal
function M.open()
  if not check_lazygit() then
    return
  end

  -- Create a floating terminal
  local lazygit_term = vim.api.nvim_open_win(vim.api.nvim_create_buf(false, true), true, {
    relative = "editor",
    row = math.floor(vim.o.lines * 0.1),
    col = math.floor(vim.o.columns * 0.1),
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
    style = "minimal",
    border = "rounded",
  })

  -- Start lazygit in the terminal
  vim.fn.termopen("lazygit")

  -- Close the floating terminal on pressing `q`
  vim.api.nvim_buf_set_keymap(
    0,
    "t",
    "q",
    "<C-\\><C-n>:lua vim.api.nvim_win_close(" .. lazygit_term .. ", true)<CR>",
    { noremap = true, silent = true }
  )
end

return M
