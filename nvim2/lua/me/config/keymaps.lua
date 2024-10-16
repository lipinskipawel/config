vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

-- I need to go back to this
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Leader mappings
vim.keymap.set("n", "<leader><leader>", "<C-^>")
vim.keymap.set("n", "<leader>ww", ":w!<CR>")
vim.keymap.set("n", "<leader>wa", ":wa!<CR>") -- write for all buffers
vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>e", ":Lex 30<CR>")

vim.keymap.set("v", "p", '"_dP')
vim.keymap.set("v", "<leader>p", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d') -- deleting void register

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "L", "<Nop>")
vim.keymap.set("n", "L", "$")

-- send copy to plus register which is also system register
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]]) not needed since I use Y as y$

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

-- does not work, window already kills itself, probably I need to send keys?
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- replace word that the cursor is on
vim.keymap.set(
    "n",
    "<leader>rs",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- quick fix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- use escape to close quickfix
vim.keymap.set("n", "<Esc>", ":cclose<CR>", opts)

vim.keymap.set("n", "so", function()
    vim.cmd("so")
end)

-- Modes
--   "n" -- normal_mode
--   "i" -- insert_mode
--   "v" -- visual_mode
--   "x" -- visual_block_mode, used for snippets
--   "t" -- term_mode
--   "c" -- command_mode

-- closes current buffer
vim.keymap.set("n", "<leader>b", ":bdelete<CR>")

-- find and replace highlighted text - substitute
-- broken
vim.keymap.set("v", "<leader>re", "hy:%s/<C-r>h//gc<left><left><left>")
-- find and replace highlighted word/word's
-- broken
vim.keymap.set("v", "<leader>rw", "hy:%s/\\<<C-r>h\\>//gc<left><left><left>")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
vim.keymap.set("n", "Right", ":bnext<CR>", opts)
vim.keymap.set("n", "Left", ":bprevious<CR>", opts)

-- shows/hides hidden characters
vim.keymap.set("n", "<leader>,", ":set invlist<CR>", opts)

-- No arrow keys
vim.keymap.set("n", "<Up>", "<Nop>", opts)
vim.keymap.set("n", "<down>", "<Nop>", opts)
vim.keymap.set("n", "<Up>", "<Nop>", opts)
vim.keymap.set("n", "<Down>", "<Nop>", opts)
vim.keymap.set("n", "<Left>", "<Nop>", opts)
vim.keymap.set("n", "<Right>", "<Nop>", opts)
