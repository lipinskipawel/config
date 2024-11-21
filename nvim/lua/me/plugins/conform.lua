return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = false,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang_format" },
                javascript = { { "prettierd", "prettier" } },
                -- Conform will run multiple formatters sequentially
                -- python = { "isort", "black" },
                -- Use a sub-list to run only the first available formatter
            },
        })
        -- Then you can use conform.format() just like you would
        -- vim.lsp.buf.format(). For example, to format on save:
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --   pattern = "*",
        --   callback = function(args)
        --     require("conform").format({ bufnr = args.buf })
        --   end,
        -- })
        -- or just setup this on the setup function using format_on_save.
    end,
}
