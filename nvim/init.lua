require("config.lazy")

-- this will change the of functions.builtin for lua files
-- https://github.com/nvim-treesitter/nvim-treesitter/blob/master/queries/lua/highlights.scm#L217
vim.cmd [[hi @function.builtin.lua guifg=yellow ]]
-- for all files
-- vim.cmd [[hi @function.builtin guifg=yellow ]]


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
