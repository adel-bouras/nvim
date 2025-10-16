return {
    -- Mason (must be loaded first)
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason LSP bridge
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
        config = function()
            -- Setup Mason first
            require("mason-lspconfig").setup({
                ensure_installed = { "neocmake" },
            })

            -- New LSP setup syntax (Neovim ≥ 0.11)
            vim.lsp.config["neocmake"] = {}
            vim.lsp.enable("neocmake")
        end,
    },

    -- Tree-sitter for Make & CMake
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "make", "cmake" },
            highlight = { enable = true },
        },
    },
}
