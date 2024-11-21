return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")

        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")

        vim.keymap.set("n", "<leader>f", builtin.find_files, {})
        vim.keymap.set("n", "<leader>g", builtin.git_files, {})
        vim.keymap.set("n", "<leader>s", builtin.live_grep, {})

        -- search in project for any string
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        -- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        -- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set("n", "<leader>h", builtin.help_tags, {})
    end,
}
