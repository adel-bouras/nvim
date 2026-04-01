return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },

            view = {
                width = 30,
            },

            renderer = {
                group_empty = true,
            },

            filters = {
                dotfiles = false,
                custom = {
                    "^node_modules$",
                    "^.git$",
                    "^dist$",
                    "^build$",
                    "^out$",
                    "^.next$",
                    "^.nuxt$",
                    "^.cache$",
                    "^.parcel-cache$",
                    "^coverage$",
                    "^.nyc_output$",
                    "^.turbo$",
                    "^.svelte-kit$",
                    -- Python
                    "^__pycache__$",
                    "^.venv$",
                    "^venv$",
                    "^.mypy_cache$",
                    "^.pytest_cache$",
                    "^*.egg-info$",
                    -- Go
                    "^vendor$",
                    -- Rust
                    "^target$",
                    -- Java / Kotlin
                    "^.gradle$",
                    "^.idea$",
                    -- General
                    "^.DS_Store$",
                    "^Thumbs.db$",
                    "^*.log$",
                },
                exclude = { ".env" },
            },

            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
                debounce_delay = 50,
                severity = {
                    min = vim.diagnostic.severity.HINT,
                    max = vim.diagnostic.severity.ERROR,
                },
            },
        })
    end,
}
