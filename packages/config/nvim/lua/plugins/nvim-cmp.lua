return {
    -- nvim-cmp の設定
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind-nvim",
        },
        config = function()
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            -- 補完候補の選択時に Tab キーで処理するためのヘルパー関数
            local has_words_before = function()
                if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
            end

            cmp.setup({

                -- snippet = {
                --     expand = function(args)
                --         -- require("luasnip").lsp_expand(args.body)
                --     end,
                -- },

                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() and has_words_before() then
                            cmp.confirm({select = true})
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    -- その他のキーマッピング
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",  -- 表示モード (symbol, symbol_text, text)
                        maxwidth = 50,         -- max 幅
                        ellipsis_char = "...", -- max 幅を超えた場合に追加される文字
                    }),
                },

                sources = cmp.config.sources({
                    { name = "copilot" }, -- copilot の補完ソース
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                }, {
                    { name = "buffer" }
                }),

                experimental = {
                    ghost_text = true,
                },
            })

            -- ※コマンドラインモードでの補完設定（必要に応じて調整）
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                    { name = "cmdline" },
                }),
            })
        end,
    },

    -- copilot.lua の設定
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = { enabled = false },
                suggestion = { enabled = false },
                copilot_node_command = "node"
                -- copilot-cmp を利用する場合、ネイティブの suggestion 表示は無効にしています
            })
        end,
    },

    -- copilot-cmp の設定
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua", "nvim-cmp" },
        config = function()
            require("copilot_cmp").setup({
                method = "getCompletionsCycling", -- 補完の取得方法。必要に応じて変更可能
            })
        end,
    },
}
