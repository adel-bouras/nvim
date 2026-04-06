return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "williamboman/mason.nvim", -- to install codelldb
        },
        keys = {
            { "<F5>",      function() require("dap").continue() end,          desc = "Debug: Continue" },
            { "<F10>",     function() require("dap").step_over() end,         desc = "Debug: Step Over" },
            { "<F11>",     function() require("dap").step_into() end,         desc = "Debug: Step Into" },
            { "<F12>",     function() require("dap").step_out() end,          desc = "Debug: Step Out" },
            { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
            {
                "<leader>B",
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "Debug: Conditional Breakpoint"
            },
            { "<leader>du", function() require("dapui").toggle() end,  desc = "Debug: Toggle UI" },
            { "<leader>dr", function() require("dap").repl.open() end, desc = "Debug: Open REPL" },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- ── Adapter ────────────────────────────────────────────────────────────
            local codelldb = vim.fn.stdpath("data") .. "/mason/bin/codelldb"

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = codelldb,
                    args = { "--port", "${port}" },
                },
            }

            -- ── C / C++ config ─────────────────────────────────────────────────────
            dap.configurations.cpp = {
                {
                    name        = "Launch",
                    type        = "codelldb",
                    request     = "launch",
                    program     = function()
                        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd         = "${workspaceFolder}",
                    stopOnEntry = false,
                    args        = {},
                },
                {
                    name    = "Attach to process",
                    type    = "codelldb",
                    request = "attach",
                    pid     = require("dap.utils").pick_process,
                    args    = {},
                },
            }
            dap.configurations.c = dap.configurations.cpp

            -- ── UI ─────────────────────────────────────────────────────────────────
            dapui.setup()
            require("nvim-dap-virtual-text").setup()

            -- auto open/close UI with the debugger
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"]     = function() dapui.close() end
        end,
    },
}
