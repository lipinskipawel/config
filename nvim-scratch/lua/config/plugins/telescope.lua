return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- it will make telescope faster
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        require("telescope").setup {
            pickers = {
                find_files = {
                    -- theme = "dropdown"
                }
            },
            extensions = {
                fzf = {}
            }
        }
        require('telescope').load_extension('fzf')

        local builtin = require('telescope.builtin')

        vim.keymap.set("n", "<leader>h", builtin.help_tags)

        vim.keymap.set("n", "<leader>f", builtin.find_files)
        vim.keymap.set("n", "<leader>g", builtin.git_files)
        vim.keymap.set("n", "<leader>s", builtin.live_grep)

        vim.keymap.set("n", "<leader>en", function()
            local opts = require('telescope.themes').get_ivy({
                cwd = vim.fn.stdpath("config")
            })
            builtin.find_files(opts)
        end)
    end
}
