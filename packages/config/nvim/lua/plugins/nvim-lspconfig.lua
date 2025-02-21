return {
    -- Mason の設定
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                -- mason のオプションを必要に応じて設定
                ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        end,
    },

    -- mason-lspconfig の設定
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                -- インストールする LSP サーバーを指定（必要に応じて追加）
                ensure_installed = {
                    "lua_ls",     -- Lua 用の LSP サーバー（sumneko_lua の後継）
                },
            })
        end,
    },

    -- nvim-lspconfig の設定
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "ray-x/lsp_signature.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")

            -- 共通 on_attach 関数 (キーマッピング等を定義)
            local on_attach = function(_, bufnr)
                -- local buf_set_keymap = vim.api.nvim_buf_set_keymap
                -- local opts = { noremap = true, silent = true }

                -- 定義へジャンプ
                -- buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
                -- 型定義へジャンプ
                -- buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
                -- 実装へジャンプ
                -- buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
                -- リネーム
                -- buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
                -- その他必要なキーマッピングを設定
                require("lsp_signature").on_attach({
                    bind = true,
                    hint_enable = true,
                    hint_prefix = " ",
                    handler_opts = {
                        border = "rounded",
                    },
                }, bufnr)
            end

            -- 共通 LSP のフラグ (オプション)
            local lsp_flags = {
                debounce_text_changes = 150,
            }

            -- mason-lspconfig を利用して、全てのインストール済みサーバーに対してデフォルトハンドラをセット
            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                        flags = lsp_flags,
                        -- 各サーバーごとの設定が必要ならここで追加設定可能
                    })
                end,

                -- もし特定のサーバーに対して個別設定が必要な場合は以下のように記述
                -- ["lua_ls"] = function()
                --   lspconfig.lua_ls.setup({
                --     on_attach = on_attach,
                --     flags = lsp_flags,
                --     settings = {
                --       Lua = {
                --         runtime = { version = 'LuaJIT' },
                --         diagnostics = { globals = { 'vim' } },
                --         workspace = {
                --           library = vim.api.nvim_get_runtime_file("", true),
                --         },
                --         telemetry = { enable = false },
                --       },
                --     },
                --   })
                -- end,
            }
        end,
    },
}
