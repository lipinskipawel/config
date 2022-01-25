local options = {
	fileencoding = "utf-8", -- the encoding written to a file
	mouse = "a", -- allow the mouse to be used in neovim
	errorbells = false,
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	guicursor = "", -- make cursor to be always block, even in insert mode
	termguicolors = true, -- set term gui colors (most terminals support this)
	swapfile = false, -- creates a swapfile
	backup = false, -- creates a backup file
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	hlsearch = false, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns, use \c
	smartcase = true, -- smart case
	expandtab = true, -- convert tabs to spaces
	tabstop = 2, -- insert 2 spaces for a tab
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	smartindent = true, -- make indenting smarter again
	foldmethod = "indent", -- set indent as fold
	foldlevelstart = 99, -- no fold by default
	hidden = true, -- keeps buffer in the background
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- start scrolling when you are close to top, bottom
	sidescrolloff = 8, -- start scrolling when you are close to right, left
	undofile = true, -- enable persistent undo
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp

	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	conceallevel = 0, -- so that `` is visible in markdown files
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 300, -- faster completion (4000ms default)
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	pumheight = 10, -- pop up menu height
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	cursorline = false, -- highlight the current line
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]]) -- make "w" treat '-' as character
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
