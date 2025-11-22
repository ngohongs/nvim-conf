return {
    "zbirenbaum/copilot.lua",
    config = function()
        if vim.fn.executable("node") ~= 1 then
            local os_name = vim.loop.os_uname().sysname
            if string.find(os_name, "Windows") then
                local exitcode = os.execute("winget install -e --id OpenJS.NodeJS")
                if exitcode == 0 then
                    print("Copilot::Please restart shell.")
                else
                    print("Copilot::Unable to install Node.js.")
                end
            elseif string.find(os_name, "Linux") then
                -- Debian based OS support
                local exitcode = os.execute(
                    "curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs")
                if exitcode == 0 then
                    print("Copilot::Please restart shell.")
                else
                    print("Copilot::Unable to install Node.js. (Run nvim in sudo -E -s for the initial setup)")
                end
            else
            end
        end
        require('copilot').setup({
            suggestion = { enabled = true, auto_trigger = true  },
        })
    end
}
