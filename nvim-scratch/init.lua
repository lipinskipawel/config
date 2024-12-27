print("Hello")

-- source current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- run the current line
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- run the selected lines
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup('yank-group', { clear = true }),
	callback = function()
		-- :help vim.highlight.on_yank()
		vim.highlight.on_yank()
	end
})

