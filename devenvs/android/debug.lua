return {
    setup_dap = function(dap)
        vim.lsp.config["kotlin_lsp"] = {
            filetypes = { 'kotlin' },
            cmd = { 'kotlin-lsp', '--stdio' },
            root_markers = {
                'settings.gradle', 
                'settings.gradle.kts', 
                'pom.xml', 
                'build.gradle', 
                'build.gradle.kts', 
                'workspace.json', 
            },
        }
        vim.lsp.enable("kotlin_lsp")

        dap.adapters["intellij_debugger"] = function(callback)
            local params = {
                command = "start_debug_server",
                arguments = {}
            }

            local clients = vim.lsp.get_clients({ name = "kotlin_lsp", bufnr = 0 })
            if #clients == 0 then
                print("kotlin_lsp is not running!")
                return
            end

            print("Starting debug server...")
            vim.lsp.buf_request(0, "workspace/executeCommand", params, function(err, result, ctx)
                if err then
                    print("Error: " .. err.message)
                    return
                end
                print("Debug server started on port " .. result)

                callback({
                    id = "intellij_debugger",
                    type = 'server',
                    host = '127.0.0.1',
                    port = result
                })
            end)
        end

        dap.configurations["kotlin"] = {
            {
                name = "Attach (Android app)",
                type = "intellij_debugger",
                request = "attach",
                port = function()
                    local_port = 8700 
                    package_name = vim.fn.system("android pkg-name")
                    package_name = vim.trim(package_name)

                    local handle = io.popen("adb shell ps -A")
                    local result = handle:read("*a")
                    handle:close()

                    local pid = nil
                    for line in result:gmatch("[^\r\n]+") do
                        if line:find(package_name, 1, true) then
                            local tokens = {}
                            for token in line:gmatch("%S+") do
                                table.insert(tokens, token)
                            end
                            pid = tokens[2]
                            break
                        end
                    end

                    vim.fn.system(string.format("adb forward --remove tcp:%d", local_port)) 
                    vim.fn.system(string.format("adb forward tcp:%d jdwp:%s", local_port, pid))
                    return local_port 
                end
            },
        }
    end
}
