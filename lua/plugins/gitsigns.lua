return { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    dependecies = {
        'folke/which-key.nvim',
    },
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
            local wk = require('which-key')

            wk.add({
                {
                    "<leader>g",
                    group = "[G]itsigns",
                },
                {
                    "<leader>gs",
                    function() require("gitsigns").stage_hunk() end,
                    desc = "[S]tage Hunk",
                },
                {
                    "<leader>gu",
                    function() require("gitsigns").undo_stage_hunk() end,
                    desc = "[U]ndo Stage Hunk",
                },
                {
                    "<leader>gr",
                    function() require("gitsigns").reset_hunk() end,
                    desc = "[R]eset Hunk",
                },
                {
                    "<leader>gp",
                    function() require("gitsigns").preview_hunk() end,
                    desc = "[P]review Hunk",
                },
                {
                    "<leader>gb",
                    function() require("gitsigns").blame_line() end,
                    desc = "[B]lame Line",
                },
                {
                    "<leader>gf",
                    function() require("gitsigns").diffthis("~1") end,
                    desc = "[D]iff This",
                },
                {
                    "<leader>gn",
                    function() require("gitsigns").next_hunk() end,
                    desc = "[N]ext Hunk",
                },
            })
        end
    },
}
