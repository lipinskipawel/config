vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

-- not needed since I'm using <leader>y remap
vim.opt.clipboard = "unnamedplus" -- allows access the system clipboard

-- vim.opt.tabstop = 4 -- insert 4 spaces for a tab
-- vim.opt.softtabstop = 4 -- not sure what is does
-- vim.opt.shiftwidth = 4 -- number of spaces inserted for each indentation
-- vim.opt.expandtab = true -- converts tab to spaces
-- vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- .. means concat

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true

vim.opt.foldmethod = "indent" -- set indent as fold
vim.opt.foldlevelstart = 99 -- no fold by default

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete
-- this is probably overriden by my WhichKey plugin

vim.opt.colorcolumn = "80"

vim.opt.termguicolors = true
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.errorbells = false

