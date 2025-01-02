return {
    'neovim/nvim-lspconfig',
    enabled = true,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        'saghen/blink.cmp',
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        require("mason").setup()
        local mason_tool_installer = require("mason-tool-installer")
        local lspconfig = require("lspconfig")
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        local ensure_installed = {
            "lua_ls",
            "gopls"
        }
        mason_tool_installer.setup { ensure_installed = ensure_installed }

        lspconfig.lua_ls.setup {
            capabilities = capabilities
        }
        lspconfig.gopls.setup({})

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                if client.supports_method('text/Document/formatting') then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        end,
                    })
                end
            end,
        })
    end
}
