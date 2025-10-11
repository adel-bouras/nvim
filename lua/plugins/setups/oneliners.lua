return {
    {
        "kndndrj/nvim-dbee",
        dependencies = { "MunifTanjim/nui.nvim" },
        build = function()
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup()
        end,
    },
    { "tpope/vim-fugitive" },
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({})
        end
    }
}
