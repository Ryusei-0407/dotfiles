vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.cmdheight = 1
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

vim.g.dracula_colortem = 0
vim.cmd([[
    try
        colorscheme dracula_pro_van_helsing
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme default
    endtry

]])

vim.cmd([[autocmd! BufRead,BufEnter *.astro set filetype=astro]])

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

-- faster
vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_gj)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_gk)", { noremap = false, silent = true })

require("impatient")
require("config.lualine")
require("config.alpha")
require("config.indentline")
require("config.telescope")
require("config.cmp")
require("lsp")
require("rust-tools").setup()
require("toggleterm").setup({
  open_mapping = [[<C-\>]],
  size = 20,
  hide_numbers = true,
  direction = 'float',
  close_on_exit = true,
})
require("nvim-treesitter.configs").setup({
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
})

return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("nvim-lualine/lualine.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-treesitter/nvim-treesitter")
    use("lukas-reineke/indent-blankline.nvim")
    use("PHSix/faster.nvim")
    use("goolord/alpha-nvim")
    use("nvim-lua/plenary.nvim")
    use("kyazdani42/nvim-web-devicons")
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    })
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")
    use({ "yioneko/nvim-yati", requires = { "nvim-treesitter/nvim-treesitter" } })
    use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("Mofiqul/dracula.nvim")
    use("machakann/vim-sandwich")
    use("simeji/winresizer")
    use({ "akinsho/toggleterm.nvim", tag = "v2.*" })
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("simrat39/rust-tools.nvim")
    use("lewis6991/impatient.nvim")
end)
