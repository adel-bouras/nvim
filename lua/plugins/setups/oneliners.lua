return {
    {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
        "kristijanhusak/vim-dadbod-ui"
    },
    { "tpope/vim-fugitive" },
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("nvim-highlight-colors").setup({})
        end
    }
}
