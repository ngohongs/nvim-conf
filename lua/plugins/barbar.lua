return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',         -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons',     -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
        
    },
    config = function(_, opts)
        require('barbar').setup(opts)

        local map = vim.keymap.set
        local opts_silent = { noremap = true, silent = true }

        -- Navigate buffers
        map('n', '<A-,>', '<cmd>BufferPrevious<cr>', { noremap = true, silent = true, desc = 'Previous buffer' })
        map('n', '<A-.>', '<cmd>BufferNext<cr>', { noremap = true, silent = true, desc = 'Next buffer' })
        -- Re-order buffers
        map('n', '<A-<>', '<cmd>BufferMovePrevious<cr>', { noremap = true, silent = true, desc = 'Move buffer left' })
        map('n', '<A->>', '<cmd>BufferMoveNext<cr>', { noremap = true, silent = true, desc = 'Move buffer right' })

        -- Goto buffer by position
        map('n', '<A-1>', '<cmd>BufferGoto 1<cr>', { noremap = true, silent = true, desc = 'Go to buffer 1' })
        map('n', '<A-2>', '<cmd>BufferGoto 2<cr>', { noremap = true, silent = true, desc = 'Go to buffer 2' })
        map('n', '<A-3>', '<cmd>BufferGoto 3<cr>', { noremap = true, silent = true, desc = 'Go to buffer 3' })
        map('n', '<A-4>', '<cmd>BufferGoto 4<cr>', { noremap = true, silent = true, desc = 'Go to buffer 4' })
        map('n', '<A-5>', '<cmd>BufferGoto 5<cr>', { noremap = true, silent = true, desc = 'Go to buffer 5' })
        map('n', '<A-6>', '<cmd>BufferGoto 6<cr>', { noremap = true, silent = true, desc = 'Go to buffer 6' })
        map('n', '<A-7>', '<cmd>BufferGoto 7<cr>', { noremap = true, silent = true, desc = 'Go to buffer 7' })
        map('n', '<A-8>', '<cmd>BufferGoto 8<cr>', { noremap = true, silent = true, desc = 'Go to buffer 8' })
        map('n', '<A-9>', '<cmd>BufferGoto 9<cr>', { noremap = true, silent = true, desc = 'Go to buffer 9' })
        map('n', '<A-0>', '<cmd>BufferLast<cr>', { noremap = true, silent = true, desc = 'Go to last buffer' })

        -- Pin/unpin buffer
        map('n', '<A-p>', '<cmd>BufferPin<cr>', { noremap = true, silent = true, desc = 'Pin buffer' })

        -- Close buffer
        map('n', '<A-c>', '<cmd>BufferClose<cr>', { noremap = true, silent = true, desc = 'Close buffer' })
        map('n', '<leader>bc', '<cmd>BufferClose<cr>', { noremap = true, silent = true, desc = 'Close buffer' })
        map('n', '<leader>bx', '<cmd>BufferCloseAllButCurrent<cr>', { noremap = true, silent = true, desc = 'Close other buffers' })
        map('n', '<leader>bl', '<cmd>BufferCloseBuffersLeft<cr>', { noremap = true, silent = true, desc = 'Close buffers to the left' })
        map('n', '<leader>br', '<cmd>BufferCloseBuffersRight<cr>', { noremap = true, silent = true, desc = 'Close buffers to the right' })

        -- Buffer picking
        map('n', '<A-b>', '<cmd>BufferPick<cr>', { noremap = true, silent = true, desc = 'Pick buffer' })
    end,
    version = '^1.0.0',     -- optional: only update when a new 1.x version is released
}
