return {
    setup_dap = function(dap)
        dap.adapters.lldb = {
            type = "executable",
            command = "xcrun",
            args = { "lldb-dap" },
            name = "apple-lldb",
            options = {
                initialize_timeout_sec = 9999,
            }
        }
        dap.configurations.swift = {
            {
                name = "Attach (iOS Simulator)",
                type = "lldb",
                request = "attach",
                pid = function() 
                    -- TODO Improve and pick the pid based on path
                    local filter = vim.fn.input('Filter process name: ')
                    return require('dap.utils').pick_process({ filter = filter })
                end,
                cwd = vim.fn.getcwd(),
            },
            {
                name = "Wait for launch (iOS Simulator)",
                type = "lldb",
                request = "attach",
                program = function()
                    path = vim.fn.system("ios exec-path")
                    path = vim.trim(path)
                    return path
                end,
                waitFor = true,
                stopOnEntry = true
            },
            {
                name = "Attach (iPhone)",
                type = "lldb",
                request = "attach",
                cwd = vim.fn.getcwd(),
                initCommands = function()
                    iphone_name = vim.fn.system("ios iphone-name")
                    iphone_name = vim.trim(iphone_name)

                    -- TODO
                    return {
                    }
                end
            }
        }
    end
}
