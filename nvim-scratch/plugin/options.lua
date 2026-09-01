local opt = vim.opt

-- Define the custom highlight group, called 'nCursor'
vim.api.nvim_set_hl(0, "nCursor", { fg = "White", bg = "White", sp = "White" })
-- vim.cmd("highlight Cursor guifg=green guibg=green")

-- use the custom highlight group, to avoid dynamic color of cursor
-- set by default by the Neovim
opt.guicursor = "a:block-nCursor"
opt.termguicolors = true
opt.clipboard = "unnamedplus" -- allow access to the system clipboard

--- visuals ---
opt.number = true
opt.relativenumber = true

opt.scrolloff = 8
opt.sidescrolloff = 8
opt.signcolumn = "yes:1"

opt.wrap = true
opt.linebreak = true
-- opt.colorcolumn = "80"

--- searching ---
opt.inccommand = "split" -- no-split, applied when using %s

opt.smartcase = true
opt.ignorecase = true

opt.hlsearch = false
opt.incsearch = true

--- windows ---
opt.splitbelow = true
opt.splitright = true

--- others ---
opt.swapfile = false

opt.backup = false
opt.writebackup = false

--- tabs, spaces ---
opt.expandtab = true -- I want spaces, not tab
opt.tabstop = 4      -- how many spaces displays for a tab
opt.shiftwidth = 4   -- number of spaces inserted for each indentation
opt.smarttab = true  -- only affects the backspace, at the start of a line. uses shiftwidth setting
opt.softtabstop = 4  -- only affects the backspace, in mid line. uses shiftwidth setting
-- opt.smartindent = true -- do smart autoindenting
-- defaults, set in buffer
-- opt.autoindent = true   -- copies indentation of previous line
-- opt.smartindent = false -- c-style, a bit smarter
-- opt.cindent = false     -- c-style, even more smarter

opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
