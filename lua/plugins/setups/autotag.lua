return {
    {
        "windwp/nvim-ts-autotag",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter.configs").setup({
                matchup = {
                    enable = true,
                    disable_virtual_text = true,
                },
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
