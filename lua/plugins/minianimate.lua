return {
    'nvim-mini/mini.animate', version = '*',
    config = function()
        require('mini.animate').setup({
            cursor = {
                timing = require('mini.animate').gen_timing.linear({ duration = 20, unit = 'total' }),
            },

            scroll = {
                timing = require('mini.animate').gen_timing.linear({ duration = 20, unit = 'total' }),
            },

            resize = {
                timing = require('mini.animate').gen_timing.linear({ duration = 20, unit = 'total' }),
            },
        })
    end,
}
