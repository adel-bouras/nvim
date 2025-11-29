return {
    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-ts-autotag").setup({
                check_ts = true, -- use Treesitter for context
                html = true, -- enable for HTML
                filetypes = { "html", "xml", "jsx", "tsx", "vue", "php", "markdown" },
            })
        end,
    },
    {
        "andymass/vim-matchup",
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
            vim.g.matchup_matchparen_deferred = 1
        end,
    },
}
