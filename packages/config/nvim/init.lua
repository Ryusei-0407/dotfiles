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
vim.opt.termguicolors = true
vim.opt.guifont = "monospace:h10"
vim.opt.ambiwidth = "single"
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])

if vim.loader then
	vim.loader.enable()
end

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

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)
vim.api.nvim_set_keymap("n", "<Enter><Enter>", "<C-w><C-w>", opts)
vim.api.nvim_set_keymap("n", "ss", ":split<CR>", opts)
vim.api.nvim_set_keymap("n", "sv", ":vsplit<CR>", opts)

vim.api.nvim_set_keymap("i", "<C-f>", "<Right>", opts)
vim.api.nvim_set_keymap("i", "<C-b>", "<Left>", opts)
vim.api.nvim_set_keymap("i", "<C-p>", "<Up>", opts)
vim.api.nvim_set_keymap("i", "<C-n>", "<Down>", opts)
vim.api.nvim_set_keymap("i", "<C-a>", "<Home>", opts)
vim.api.nvim_set_keymap("i", "<C-e>", "<End>", opts)

vim.g.winresizer_start_key = "<C-s>"

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

require("lazy").setup({
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"lewis6991/gitsigns.nvim",
	"nvim-tree/nvim-web-devicons",
	"simeji/winresizer",
	{
		"gbprod/cutlass.nvim",
		opts = {
			cut_key = nil,
			override_del = true,
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config/lualine")
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>lg", "<CMD>LazyGit<CR>" },
		},
	},
	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
		config = function()
			require("hlchunk").setup({
				blank = { enable = false },
			})
			vim.cmd([[EnableHLLineNum]])
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
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
		end,
	},
	{
		"m-demare/hlargs.nvim",
		config = true,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			require("config/alpha")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<C-e>", "<CMD>Neotree toggle=true<CR>" },
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = true,
						force_visible_in_empty_folder = true,
						show_hidden_count = false,
					},
				},
			})
			vim.cmd([[
                highlight NeoTreeRootName gui=bold
                highlight NeoTreeGitConflict gui=bold
                highlight NeoTreeUntracked gui=none
            ]])
		end,
	},
	{
		"folke/trouble.nvim",
		keys = {
			{ "<leader>tt", "<CMD>TroubleToggle<CR>" },
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-media-files.nvim",
		},
		keys = {
			{ "<leader>f", "<CMD>Telescope find_files<CR>" },
			{ "<C-f>", "<CMD>Telescope live_grep<CR>" },
		},
		config = function()
			require("config/telescope")
		end,
	},
	{
		"yioneko/nvim-yati",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		vim.keymap.set("n", "<leader>h", function()
			vim.cmd("BufferPrevious")
		end),
		vim.keymap.set("n", "<leader>l", function()
			vim.cmd("BufferNext")
		end),
		vim.keymap.set("n", "<leader>w", function()
			vim.cmd("BufferClose")
		end),
		lazy = false,
	},
	-- {
	-- 	"Mofiqul/dracula.nvim",
	-- 	config = function()
	-- 		vim.cmd([[
	--             colorscheme dracula
	--             colorscheme dracula_pro
	--         ]])
	-- 	end,
	-- },
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-\>]],
				size = 20,
				hide_numbers = true,
				direction = "float",
				close_on_exit = true,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
		},
		config = function()
			require("config/cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("lsp")
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		config = true,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { { "prettierd", "eslint" } },
					typescript = { { "prettierd", "eslint" } },
					typescriptreact = { { "prettierd", "eslint" } },
					go = { { "gofmt", "goimports" } },
					rust = { "rustfmt" },
					json = { "jq" },
					["*"] = { "codespell" },
					["_"] = { "trim_whitespace" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = true,
	},
	{
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = true,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		config = true,
	},
	{
		"akinsho/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "typescriptreact" },
		config = true,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = true,
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		config = true,
	},
	{
		"michaelb/sniprun",
		build = "sh ./install.sh",
		config = true,
	},
})
