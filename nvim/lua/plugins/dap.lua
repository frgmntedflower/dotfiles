
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
        },

        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            require("nvim-dap-virtual-text").setup()

            -- CodeLLDB adapter
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.cpp = {
                {
                    name = "Launch executable",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Executable path: ",
                            vim.fn.getcwd() .. "/build/debug/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }

            dap.configurations.c = dap.configurations.cpp

            dap.listeners.after.event_initialized["dapui"] = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated["dapui"] = function()
                dapui.close()
            end

            dap.listeners.before.event_exited["dapui"] = function()
                dapui.close()
            end

            local map = vim.keymap.set

            map("n", "<F5>", dap.continue, { desc = "Start/Continue debugger" })
            map("n", "<F10>", dap.step_over, { desc = "Step over" })
            map("n", "<F11>", dap.step_into, { desc = "Step into" })
            map("n", "<F12>", dap.step_out, { desc = "Step out" })
            map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
            map("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end, { desc = "Conditional breakpoint" })
            map("n", "<leader>du", dapui.toggle, { desc = "Toggle debugger UI" })
        end,
    },
}
