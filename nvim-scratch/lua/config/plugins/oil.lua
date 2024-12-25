return {
    'stevearc/oil.nvim',
    enabled = true,
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
        require("oil").setup({
            columns = { "icon" },
            keymaps = {
                ["<C-h"] = false,
                -- ["<M-h>"] = "actions.select_split",
            },
            view_options = {
                show_hidden = true,
            },
        })

        vim.keymap.set(
            "n",
            "-",
            "<cmd>Oil<CR>",
            { desc = "Open parent directory" }
        )
    end,
}
