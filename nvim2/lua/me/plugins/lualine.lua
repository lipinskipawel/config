-- :h lualine.txt
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = false,
        theme = 'powerline',
        component_separators = '|',
        section_separators = '',
      }
    })
  end
}

