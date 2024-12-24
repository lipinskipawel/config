require("config.lazy")

print("Hello")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus" -- allow access to the system clipboard

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- this will change the of functions.builtin for lua files
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/lua/highlights.scm#L217
vim.cmd [[hi @function.builtin.lua guifg=yellow ]]
-- for all files
-- vim.cmd [[hi @function.builtin guifg=yellow ]]

-- source current file
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
-- run the current line
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
-- run the selected lines
vim.keymap.set("v", "<leader>x", ":lua<CR>")


-- this is in nvim nightly
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)


vim.keymap.set("n", "<leader><leader>", "<C-^>")
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>aw", ":wa!<CR>") -- write for all buffers
vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>e", ":Lex 30<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup('yank-group', { clear = true }),
    callback = function()
        -- :help vim.highlight.on_yank()
        vim.highlight.on_yank()
    end
})
