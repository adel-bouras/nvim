return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules/",
                    "%.git/",
                    "dist/",
                    "build/",
                    "out/",
                    "%.next/",
                    "%.nuxt/",
                    "%.cache/",
                    "%.parcel-cache/",
                    "coverage/",
                    "%.nyc_output/",
                    "%.turbo/",
                    "%.svelte-kit/",
                    -- Python
                    "__pycache__/",
                    "%.venv/",
                    "venv/",
                    "%.mypy_cache/",
                    "%.pytest_cache/",
                    "%.egg-info/",
                    -- Go
                    "vendor/",
                    -- Rust
                    "target/",
                    -- Java / Kotlin
                    "%.gradle/",
                    "%.idea/",
                    -- General
                    "%.DS_Store",
                    "Thumbs%.db",
                    "%.log",
                },
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
}
