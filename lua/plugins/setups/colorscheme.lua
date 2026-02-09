local function transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) -- non-current windows
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- sign column
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })  -- line numbers
end
return {
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        config = function()
            vim.cmd.colorscheme("gruvbox")
            vim.o.background = "dark"
            transparent() --uncomment for transparent nvim bg
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true,
        config = function()
            vim.cmd.colorscheme("catppuccin")
            transparent() --uncomment for transparent nvim bg
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "moon", -- storm, moon, night, day
                transparent = true, -- toggle with true
                terminal_colors = false,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },
            })
            vim.cmd.colorscheme("tokyonight")
            --            vim.o.background = "dark"
            transparent() --uncomment for transparent nvim bg
        end,
    },
}
