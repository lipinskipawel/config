local opt = vim.opt

opt.guicursor = ""
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
opt.shiftwidth = 4 -- number of spaces inserted for each indentation
opt.tabstop = 4    -- insert 4 spaces for a tab
-- opt.expandtab = true
-- opt.softtabstop = 4
-- opt.smartindent = true -- do smart autoindenting

opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
