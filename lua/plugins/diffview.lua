return {
    'sindrets/diffview.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        view = {
            merge_tool = {
                layout = "diff3_mixed",
            }
        },
        use_icons = true,
    }
}
