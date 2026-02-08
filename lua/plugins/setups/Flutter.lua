return {
    -- Flutter tools (highly recommended)
    {
        "akinsho/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("flutter-tools").setup({})
        end,
    },
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
    },
}
