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


-- M is meta key (which is usually Alt)
-- A is Atl
vim.keymap.set("n", "A-j", "<cmd>cnext<CR>")
vim.keymap.set("n", "A-k", "<cmd>cprev<CR>")


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

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('term-open-group', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

local job_id = 0
vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J") -- move window down
    vim.api.nvim_win_set_height(0, 15)

    job_id = vim.bo.channel
end)

vim.keymap.set("n", "<leader>tt", function()
    vim.fn.chansend(job_id, { "echo 'run my tests here'\r\n" })
end)
