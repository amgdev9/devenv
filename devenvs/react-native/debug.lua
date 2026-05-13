return {
    setup_dap = function(dap)
        dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = "node",
                args = { vim.fn.expand("$HOME/LSP/js-debug/src/dapDebugServer.js"), "${port}"},
            }
        }

        local exts = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

        for _, ext in ipairs(exts) do
            dap.configurations[ext] = {
                {
                    type = "pwa-node",
                    request = "attach",
                    cwd = vim.fn.getcwd(),
                    sourceMaps = true,
                    name = "Attach to Metro (React Native)",
                    port = function()
                        print("Downloading source map from Metro...")
                        vim.fn.system("rm index.map && curl -o index.map http://localhost:8081/index.map?platform=ios&dev=true")
                        return 8081
                    end,
                },
            }
        end
    end
}
