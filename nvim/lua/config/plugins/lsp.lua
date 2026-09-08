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
            "gopls",
            "clangd"
        }
        mason_tool_installer.setup { ensure_installed = ensure_installed }

        -- server-specific overrides live in ./servers/<name>.lua
        local servers = { "lua_ls", "gopls", "clangd" }

        for _, name in ipairs(servers) do
            local ok, server_opts = pcall(require, "config.plugins.servers." .. name)
            if not ok then
                server_opts = {}
            end
            server_opts.capabilities = capabilities
            lspconfig[name].setup(server_opts)
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                if client:supports_method('textDocument/formatting') then
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
