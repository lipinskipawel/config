local set = vim.keymap.set

set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute/source the current file" })
set("n", "<leader>x", ":.lua<CR>", { desc = "Execute/source the current line" })
set("v", "<leader>x", ":lua<CR>", { desc = "Execute/source the current selected lines" })


-- quickfix
set("n", "A-j", "<cmd>cnext<CR>zz", { desc = "Go to NEXT error on quickfix list" })
set("n", "A-k", "<cmd>cprev<CR>zz", { desc = "Go to PREV error on quickfix list" })
set("n", "<leader>co", ":copen<CR>", { desc = "Open quickfix" })
set("n", "<leader>cc", ":cclose<CR>", { desc = "Use ESC to close quickfix" })

-- PR in neovim https://github.com/neovim/neovim/pull/28650/files
-- :help lsp-quickstart
-- default mappings https://neovim.io/doc/user/vim_diff.html#default-mappings
set('n', '<C-]>', vim.lsp.buf.definition, { desc = "Jumps to the definition" })
set('n', 'gri', vim.lsp.buf.implementation, { desc = "List all the implementations" })

set('n', 'grr', vim.lsp.buf.references, { desc = "List all references" })
set('n', 'grn', vim.lsp.buf.rename, { desc = "Rename all references symbol" })
set({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, { desc = "Open code action under the cursor" })
set('i', '<C-s>', vim.lsp.buf.signature_help, { desc = "Dispaly signature help under the cursor" })
-- existing
-- set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous error" })
-- set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next error" })


-- see also config of lsp-zero
-- https://lsp-zero.netlify.app/blog/lsp-config-overview.html
set('n', '<C-w>d', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "Open floating window with errors/warnings" })
set('n', '<C-w>o', function() vim.lsp.buf.workspace_symbol() end, { desc = "Query workspace symbols" })

-- investigate
-- set("v", "p", '"_dP')
-- set("v", "<leader>p", '"_dP')
-- set({ "n", "v" }, "<leader>d", '"_d') -- deleting void register

set('t', '<esc><esc>', "<C-\\><C-n>", { desc = "Use double-ESC to switch to normal mode in terminal" })

set("n", "<leader><leader>", "<C-^>", { desc = "Go to previous buffer" })
set("n", "<leader>w", ":w!<CR>")
set("n", "<leader>q", ":q!<CR>")
set("n", "<leader>aw", ":wa!<CR>", { desc = "Write for all buffers" })
set("n", "<leader>b", ":bdelete<CR>", { desc = "Closes current buffer" })


set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz", { desc = "Keep screen in the middle while moving" })
set("n", "<C-u>", "<C-u>zz", { desc = "Keep screen in the middle while moving" })
set("n", "n", "nzzzv", { desc = "Keep screen in the middle while going to next item" })
set("n", "N", "Nzzzv", { desc = "Keep screen in the middle while going to next item" })

--- Do I need them? ---
-- set("v", "p", '"_dP')
-- set("v", "<leader>p", '"_dP')
-- set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete void register" })

-- move text up and down
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text down" })
set("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move selected text down" })
set("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move selected text up" })

-- Modes
--   "n" -- normal_mode
--   "i" -- insert_mode
--   "v" -- visual_mode
--   "x" -- visual_block_mode, used for snippets
--   "t" -- term_mode
--   "c" -- command_mode

-- Keys
--   "C" -- is Ctrl
--   "M" -- is Meta key (which is usually Alt)
--   "A" -- is Atl

vim.keymap.set("n", "<leader>,", ":set invlist<CR>", { desc = "Show/hide hidden characters" })

vim.keymap.set("n", "<Up>", "<Nop>", { desc = "No arrows" })
vim.keymap.set("n", "<Down>", "<Nop>", { desc = "No arrows" })
vim.keymap.set("n", "<Left>", "<Nop>", { desc = "No arrows" })
vim.keymap.set("n", "<Right>", "<Nop>", { desc = "No arrows" })
