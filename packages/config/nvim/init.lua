vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 4
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.timeoutlen = 1000
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.cursorline = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h10"
vim.opt.ambiwidth = "single"
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])

vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1
vim.g.did_indent_on = 1
vim.g.did_load_ftplugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.skip_loading_mswin = 1

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

vim.api.nvim_set_keymap("n", "ss", ":split<CR>", opts)
vim.api.nvim_set_keymap("n", "sv", ":vsplit<CR>", opts)

-- lazygit
vim.api.nvim_set_keymap("n", "lg", ":LazyGit<CR>", opts)
-- neo-tree
vim.api.nvim_set_keymap("n", "<C-e>", ":Neotree toggle=true<CR>", opts)
-- telescope
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>Telescope live_grep<CR>", opts)
-- winresizer
vim.g.winresizer_start_key = "<C-s>"
-- barbar
vim.api.nvim_set_keymap("n", "<Space>h", ":BufferPrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<Space>l", ":BufferNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<Space>,", ":BufferMovePrevious<CR>", opts)
vim.api.nvim_set_keymap("n", "<Space>.", ":BufferMoveNext<CR>", opts)
vim.api.nvim_set_keymap("n", "<Space>w", ":BufferClose<CR>", opts)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        config = true,
    },
    {
        "nvim-lua/popup.nvim",
        lazy = true,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            require("nvim-treesitter/configs").setup({
                ensure_installed = "all",
                ignore_install = { "phpdoc" },
                context_commentstring = {
                    enable = true,
                },
                highlight = {
                    enable = true,
                    disable = { "lua" },
                },
                indent = {
                    enable = true,
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                },
            })
        end
    },
    {
        "fedepujol/bracket-guides",
        lazy = true,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("config/alpha")
        end
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    "kyazdani42/nvim-web-devicons",
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = true,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        keys = {
            { "<C-e>", "<CMD>Neotree toggle=true<CR>" }
        },
        config = function()
            require("config/neo-tree")
        end
    },
    {
        "folke/trouble.nvim",
        lazy = true,
        dependencies = { "kyazdani42/nvim-web-devicons" },
        config = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = { "nvim-telescope/telescope-media-files.nvim" },
        config = function()
            require("config/telescope")
        end
    },
    {
        "yioneko/nvim-yati",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "romgrk/barbar.nvim",
        lazy = false,
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        config = function()
            vim.cmd([[
                colorscheme dracula
                colorscheme dracula_pro
            ]])
        end
    },
    "machakann/vim-sandwich",
    "simeji/winresizer",
    {
        "akinsho/toggleterm.nvim",
        lazy = true,
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<C-\>]],
                size = 20,
                hide_numbers = true,
                direction = "float",
                close_on_exit = true,
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = true,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            require("config/cmp")
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        config = true,
    },
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "MunifTanjim/prettier.nvim",
        },
        config = function()
            require("lsp")
        end
    },
    {
        "simrat39/rust-tools.nvim",
        lazy = true,
        config = true,
    },
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        config = true,
    },
    {
        "j-hui/fidget.nvim",
        lazy = false,
        config = true,
    },
    {
        "lewis6991/impatient.nvim",
    }
})
