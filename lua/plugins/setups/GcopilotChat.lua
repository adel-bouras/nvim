return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
        { "zbirenbaum/copilot.lua" },
        { "nvim-lua/plenary.nvim" },
    },
    event = "VeryLazy",
    config = function()
        local chat = require("CopilotChat")
        chat.setup({
            debug = true,
            window = {
                layout = "vertical",
                width = 0.3,
                height = 1,
                border = "rounded",
            },
            mappings = {
                submit_prompt = {
                    normal = "<CR>", -- Press Enter in normal mode to send
                    insert = "<C-s>", -- Press Ctrl+s in insert mode to send
                },
                reset = {
                    normal = "<C-r>", -- Reset chat
                },
            },
        })

        -- Toggle with Ctrl+c
        vim.keymap.set({ "n", "i", "v" }, "<C-x>", function()
            chat.toggle()
        end, { desc = "Toggle Copilot Chat" })

        -- Other useful keymaps
        vim.keymap.set("v", "<Space>ce", ":CopilotChatExplain<CR>", { desc = "Explain code" })
        vim.keymap.set("v", "<Space>cf", ":CopilotChatFix<CR>", { desc = "Fix code" })
    end,
    -- REMOVE the cmd line - it's causing lazy loading conflicts
}
