require("config.lazy")

print("Hello")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus" -- allow access to the system clipboard

-- this will change the of functions.builtin for lua files
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/lua/highlights.scm#L217
vim.cmd [[hi @function.builtin.lua guifg=yellow ]]
-- for all files
-- vim.cmd [[hi @function.builtin guifg=yellow ]]

-- source current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- run the current line
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- run the selected lines
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- this is in nvim nightly
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup('yank-group', { clear = true }),
    callback = function()
        -- :help vim.highlight.on_yank()
        vim.highlight.on_yank()
    end
})
