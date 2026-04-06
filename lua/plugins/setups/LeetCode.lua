return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        -- optional but recommended:
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
        "3rd/image.nvim", -- for image rendering
    },
    opts = {
        lang = "cpp", -- default language (python3, java, javascript, etc.)
    },
}
