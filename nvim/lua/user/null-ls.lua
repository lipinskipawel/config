local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		-- npm install -g --save-dev --save-exact @fsouza/prettierd
		formatting.prettierd,
		-- cargo install stylua
		formatting.stylua,
		diagnostics.eslint_d,
	},
	-- this will format code on save
	-- you can reuse a shared lspconfig on_attach callback here
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
          augroup END
          ]])
		end
	end,
})
