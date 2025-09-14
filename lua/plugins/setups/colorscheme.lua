local function transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "gruvbox"
            vim.o.background = "dark"
            transparent() --uncomment for transparent nvim bg
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        config = function()
            vim.cmd.colorscheme "catppuccin"
            transparent() --uncomment for transparent nvim bg
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = true,
        config = function()
            vim.cmd.colorscheme "tokyonight"
            transparent() --uncomment for transparent nvim bg
        end
    },
}
