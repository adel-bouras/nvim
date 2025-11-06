return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",            -- the main active branch
    dependencies = {
        { "zbirenbaum/copilot.lua" }, -- your existing Copilot setup
        { "nvim-lua/plenary.nvim" }, -- required for async stuff
    },
    config = function()
        local chat = require("CopilotChat")

        chat.setup({
            debug = false, -- set to true if you want to see logs
            window = {
                layout = "float", -- 'vertical', 'horizontal', or 'float'
                width = 0.8,
                height = 0.8,
                border = "rounded",
            },
            prompts = {
                Explain = "Explain this code",
                Fix = "Find problems and fix them",
                Optimize = "Make this faster or cleaner",
                Docs = "Add helpful documentation",
                Tests = "Write unit tests for this code",
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>cc", chat.open, { desc = "Open Copilot Chat" })
        vim.keymap.set("v", "<leader>cc", chat.open, { desc = "Chat about selected code" })
    end,
    cmd = { "CopilotChat", "CopilotChatOpen", "CopilotChatExplain", "CopilotChatFix" },
}
