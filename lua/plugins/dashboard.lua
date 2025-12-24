return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
        { 'juansalvatore/git-dashboard-nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    opts = function()
      -- Fallback ASCII header if git-dashboard fails
      local fallback_header = {
        '',
        '',
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        '                                                     ',
        '',
        '',
      }

      -- Check if we're inside a git repository
      local function is_git_repo()
        local result = vim.fn.system('git rev-parse --is-inside-work-tree')
        return vim.v.shell_error == 0 and result:match('true')
      end

      local header
      if is_git_repo() then
        -- Try to load git-dashboard, fallback on error
        local ok, git_dashboard = pcall(function()
          return require('git-dashboard-nvim').setup {}
        end)

        if ok and git_dashboard and type(git_dashboard) == 'table' and #git_dashboard > 0 then
          header = git_dashboard
        else
          header = fallback_header
        end
      else
        header = fallback_header
      end

      local opts = {
        theme = 'doom',
        config = {
          header = header,
          center = {
            { action = '', desc = '', icon = '', key = 'n' },
          },
          footer = function()
            return {}
          end,
        },
      }

      -- extra dashboard nvim config ...

      return opts
    end,
}
