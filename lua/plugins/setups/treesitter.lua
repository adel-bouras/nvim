return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.config")
        config.setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            ensure_installed = {
                "lua",
                "tsx",
                "typescript",
                "go",
                "sql",
                "html",
                "javascript",
            },
            auto_install = false,
        })
    end,
}
