return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = false, -- disable side panel
            },
            suggestion = {
                enabled = true,
                auto_trigger = true, -- show ghost text automatically
                debounce = 75,
                keymap = {
                    accept = "<C-l>",
                    next = "<C-j>",
                    prev = "<C-k>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                markdown = true,
                help = false,
            },
        })
    end,
}
