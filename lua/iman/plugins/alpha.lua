local possession = require('possession');
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local session_list = function()
  local session_dir = possession.config.session_dir
  local sessions = vim.fn.globpath(session_dir, '*', false, 1)
  local items = {}

  for _, session in ipairs(sessions) do
    local name = vim.fn.fnamemodify(session, ':t')
    table.insert(items, {
      name,
      function()
        possession.load(name)
      end,
    })
  end

  return items
end
-- Custom ASCII Art

local new = {
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[]],
	[[ ██████╗  ██████╗  ██████╗  ██████╗ ███████╗██╗   ██╗    ]],
	[[ ██╔══██╗██╔═══██╗██╔═══██╗██╔════╝ ██╔════╝╚██╗ ██╔╝     ]],
	[[ ██████╔╝██║   ██║██║   ██║██║  ███╗█████╗   ╚████╔╝     ]],
	[[ ██╔══██╗██║   ██║██║   ██║██║   ██║██╔══╝    ╚██╔╝      ]],
	[[ ██████╔╝╚██████╔╝╚██████╔╝╚██████╔╝███████╗   ██║      ]],
	[[ ╚═════╝  ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝       ]],
	[[]],
	[[██████╗        ██╗     ██╗   ██╗███████╗███████╗██╗   ██╗ ]],
	[[██╔══██╗       ██║     ██║   ██║██╔════╝██╔════╝╚██╗ ██╔╝]],
	[[██║  ██║       ██║     ██║   ██║█████╗  █████╗   ╚████╔╝ ]],
	[[██║  ██║       ██║     ██║   ██║██╔══╝  ██╔══╝    ╚██╔╝  ]],
	[[██████╔╝██╗    ███████╗╚██████╔╝██║     ██║        ██║   ]],
	[[╚═════╝ ╚═╝    ╚══════╝ ╚═════╝ ╚═╝     ╚═╝        ╚═╝   ]],
}

dashboard.section.header.val = new


-- Set menu options if desired
-- dashboard.section.buttons.val = {
-- 	dashboard.button("o p", "  Open Projects", ":NvimTreeToggle ~/Documents/Dev<CR>"),
-- 	dashboard.button("l s", "  Load Session", ":source ~/.config/nvim/sessions/<PROJECT_NAME>.vim<CR>"),
-- 	dashboard.button("t", "  Terminal", ":ToggleTerm<CR>"),
-- 	-- dashboard.button("c", "  NVIM Config", ":e ~/.config/nvim/init.lua<CR>"),
-- 	dashboard.button("c", "  NVIM Config", ":NvimTreeToggle ~/.config/nvim<CR>"),
-- 	dashboard.button("q", "  Quit", ":qa<CR>"),
-- }
dashboard.section.buttons.val = {
  dashboard.button("s", "  Load Session", session_list),
  dashboard.button("n", "  New File", ":ene<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Footer
dashboard.section.footer.val = "Don't quit. Just build it"

-- Setup alpha
alpha.setup(dashboard.opts)
