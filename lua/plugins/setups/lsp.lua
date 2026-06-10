return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        "zbirenbaum/copilot-cmp",
        -- Snippets
        'L3MON4D3/LuaSnip',
        'onsails/lspkind.nvim', 'rafamadriz/friendly-snippets',
    },
    config = function()
        local autoformat_filetypes = {
            "lua",
            "py",
            "java",
            "sql"
        }
        -- Create a keymap for vim.lsp.buf.implementation
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end
                if vim.tbl_contains(autoformat_filetypes, vim.bo.filetype) then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({
                                formatting_options = { tabSize = 4, insertSpaces = true },
                                bufnr = args.buf,
                                id = client.id
                            })
                        end
                    })
                end
            end
        })
        -- Add borders to floating windows
        --        vim.lsp.handlers['textDocument/hover'] = function(err, result, ctx, config)
        --            config = vim.tbl_deep_extend('force', config or {}, { border = 'rounded' })
        --            vim.lsp.handlers.hover(err, result, ctx, config)
        --        end
        --
        --        vim.lsp.handlers['textDocument/signatureHelp'] = function(err, result, ctx, config)
        --            config = vim.tbl_deep_extend('force', config or {}, { border = 'rounded' })
        --            vim.lsp.handlers.signature_help(err, result, ctx, config)
        --        end
        -- Configure error/warnings interface
        vim.diagnostic.config({
            virtual_text = true,
            severity_sort = true,
            float = {
                style = "minimal",
                border = 'rounded',
                source = true,
                header = '',
                prefix = '',
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '✘',
                    [vim.diagnostic.severity.WARN] = '▲',
                    [vim.diagnostic.severity.HINT] = '⚑',
                    [vim.diagnostic.severity.INFO] = '»',
                },
            },
        })

        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        -- This is where you enable features that only work
        -- if there is a language server active in the file
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set('n', 'K', function()
                    vim.lsp.buf.hover({ border = 'rounded' })
                end, opts)
                vim.keymap.set('n', 'gs', function()
                    vim.lsp.buf.signature_help({ border = 'rounded' })
                end, opts)


                --                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                --                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end,
        })

        require('mason').setup({
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "eslint",
                "pyright",
                "yamlls",
                "clangd",
                "html",
                "cssls",
                "jdtls",
                "gopls",
                "tailwindcss"
            },
            handlers = {
                function(server_name)
                    if server_name == "lua_ls" then return end -- avoid starting with {}
                    require('lspconfig')[server_name].setup({
                        on_attach = function(client, bufnr)
                            -- Disable tsserver formatting
                            client.server_capabilities.documentFormattingProvider = false
                        end,
                    })
                end,

                lua_ls = function()
                    require('lspconfig').lua_ls.setup({
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                                workspace = {
                                    library = { vim.env.VIMRUNTIME },
                                },
                            },
                        },
                    })
                end,
            },
        })

        local cmp = require('cmp')

        cmp.setup.filetype({ "sql" }, {
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" }
            }
        })

        require('luasnip.loaders.from_vscode').lazy_load()

        vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }


        cmp.setup({
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            window = {
                completion = cmp.config.window.bordered({
                    border = 'rounded',
                    winhighlight = 'Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None',
                }),
                documentation = cmp.config.window.bordered({
                    border = 'rounded',
                    winhighlight = 'Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None',
                }),
            },
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = "copilot", group_index = 2 }, -- ADD THIS LINE
                { name = 'buffer',  keyword_length = 3 },
                { name = 'luasnip', keyword_length = 2 },
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            formatting = {
                fields = { 'kind', 'abbr', 'menu' },
                format = function(entry, vim_item)
                    local kind_icons = {
                        Text = "󰉿",
                        Method = "󰆧",
                        Function = "󰊕",
                        Constructor = "",
                        Field = "󰜢",
                        Variable = "󰀫",
                        Class = "󰠱",
                        Interface = "",
                        Module = "",
                        Property = "󰜢",
                        Unit = "󰑭",
                        Value = "󰎠",
                        Enum = "",
                        Keyword = "󰌋",
                        Snippet = "",
                        Color = "󰏘",
                        File = "󰈙",
                        Reference = "󰈇",
                        Folder = "󰉋",
                        EnumMember = "",
                        Constant = "󰏿",
                        Struct = "󰙅",
                        Event = "",
                        Operator = "󰆕",
                        TypeParameter = "",
                    }

                    -- Check if it's from Copilot source and override the icon
                    if entry.source.name == 'copilot' then
                        vim_item.kind = ""
                        vim_item.kind_hl_group = "CmpItemKindCopilot"
                    else
                        -- Use the icon for the kind
                        local icon = kind_icons[vim_item.kind] or ""
                        vim_item.kind = string.format('%s %s', icon, vim_item.kind)
                    end

                    -- Source menu
                    local source_menu = {
                        copilot = "[Copilot]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snippet]",
                        buffer = "[Buffer]",
                        path = "[Path]",
                    }
                    vim_item.menu = source_menu[entry.source.name] or string.format("[%s]", entry.source.name)

                    return vim_item
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- confirm completion item
                ['<CR>'] = cmp.mapping.confirm({ select = false }),

                -- scroll documentation window
                ['<C-f>'] = cmp.mapping.scroll_docs(5),
                ['<C-u>'] = cmp.mapping.scroll_docs(-5),

                -- toggle completion menu
                ['<C-e>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.abort()
                    else
                        cmp.complete()
                    end
                end),

                -- tab complete
                ['<Tab>'] = cmp.mapping(function(fallback)
                    local col = vim.fn.col('.') - 1

                    if cmp.visible() then
                        cmp.select_next_item({ behavior = 'select' })
                    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, { 'i', 's' }),

                -- go to previous item
                ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),

                -- navigate to next snippet placeholder
                ['<C-d>'] = cmp.mapping(function(fallback)
                    local luasnip = require('luasnip')

                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                -- navigate to the previous snippet placeholder
                ['<C-b>'] = cmp.mapping(function(fallback)
                    local luasnip = require('luasnip')

                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
        })
        -- Custom highlight groups
        vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
        vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#D4A5A5" })
        vim.api.nvim_set_hl(0, "CmpItemKindDefault", { fg = "#A6B5C5" })

        -- Style the completion menu
        vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8E91", strikethrough = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bold = true })
        vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", italic = true })
    end
}
