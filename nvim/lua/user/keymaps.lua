local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap \ as leader key
keymap("", "\\", "<Nop>", opts)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Leader mappings
-- open an directory explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)
-- switches between two last buffers
keymap("n", "<leader><leader>", "<C-^>", opts)
-- replacing highlighted text with the text from implicit register
keymap("v", "<leader>p", '"_dP', opts)
-- closes current buffer
keymap("n", "<leader>b", ":bdelete<CR>", opts)
-- quick save
keymap("n", "<leader>w", ":w!<CR>", { noremap = false, silent = true })

-- find and replace highlighted text - substitute
keymap("v", "<leader>re", "hy:%s/<C-r>h//gc<left><left><left>", opts)
-- find and replace highlighted word/word's
keymap("v", "<leader>rw", "hy:%s/\\<<C-r>h\\>//gc<left><left><left>", opts)

keymap("n", "<leader>g", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "Right", ":bnext<CR>", opts)
keymap("n", "Left", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Keep cursor at the center of screen while finding next element
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- when moving lines up, your cursor stays in the same spot
keymap("n", "J", "mzJ`z", opts)

-- vim will treat Y the same way as C and D
keymap("n", "Y", "y$", opts)

-- use escape to close quickfix
keymap("n", "<Esc>", ":cclose<CR>", opts)

-- No arrow keys
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<down>", "<Nop>", opts)
keymap("n", "<Up>", "<Nop>", opts)
keymap("n", "<Down>", "<Nop>", opts)
keymap("n", "<Left>", "<Nop>", opts)
keymap("n", "<Right>", "<Nop>", opts)
