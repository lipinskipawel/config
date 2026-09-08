return {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
        local pairs = require 'mini.pairs'
        pairs.setup()
    end
}
