-- :h lualine.txt
return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = false,
                theme = "powerline",
                component_separators = "|",
                section_separators = "",
            },
        })
    end,
}
