return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  config = function()
    local os_name = vim.loop.os_uname().sysname
    if string.find(os_name, "Windows") then
      if vim.fn.executable("clang") ~= 1 then
        local exitcode = os.execute("winget install -i LLVM.LLVM")
        if exitcode == 0 then
          print("Treesitter::Please restart shell.")
        else
          print("Treesitter::Unable to install clang.")
        end
      end
    end

    require("nvim-treesitter.configs").setup({
      ensure_installed = vim.tbl_keys(require("languages").language_servers),
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    })
  end
}
