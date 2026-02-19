return {
    -- 1. Cursor animation
    {
        "sphamba/smear-cursor.nvim",
        event = "VeryLazy",
        opts = {
            smear_between_buffers = true,
            smear_between_neighbor_lines = true,
            min_horizontal_distance_smear = 2,
            min_vertical_distance_smear = 1,
            cursor_color = "#d4be98", -- match your theme
            normal_bg = "#1d2021",
        },
    },

    -- 2. Cursor line animation (highlights current line smoothly)
    {
        "yamatsum/nvim-cursorline",
        event = "VeryLazy",
        opts = {
            cursorline = {
                enable = true,
                timeout = 1000, -- show after 1s of no movement
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 3,
                hl = { underline = true },
            },
        },
    },

    -- 3. Scroll animation
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        opts = {
            mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
            hide_cursor = false,
            stop_eof = true,
            easing = "quadratic", -- smooth easing
            duration_multiplier = 0.8,
        },
    },
}
