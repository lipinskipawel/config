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

        vim.keymap.set("n", "<leader>fh", builtin.help_tags)

        vim.keymap.set("n", "<leader>fd", builtin.find_files)
        vim.keymap.set("n", "<leader>fg", builtin.git_files)
        vim.keymap.set("n", "<leader>fs", builtin.live_grep)

        vim.keymap.set("n", "<leader>en", function()
            local opts = require('telescope.themes').get_ivy({
                cwd = vim.fn.stdpath("config")
            })
            builtin.find_files(opts)
        end)

        -- find files that came from your plugins
        vim.keymap.set("n", "<leader>ep", function()
            builtin.find_files {
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
            }
        end)

        require "config.telescope.multigrep".setup()
    end
}
