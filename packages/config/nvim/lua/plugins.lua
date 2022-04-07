local status_ok, paq = pcall(require, "paq")
if not status_ok then
	return
end

paq({
	"savq/paq-nvim",
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	{ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } },
	"glepnir/zephyr-nvim",
	"lukas-reineke/indent-blankline.nvim",
	"machakann/vim-sandwich",
	"segeljakt/vim-silicon",
	"simeji/winresizer",
    "github/copilot.vim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-media-files.nvim",
	-- faster option plugins
	{
	"PHSix/faster.nvim",
		event = { "VimEnter *" },
		config = function()
			vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_gj)", { noremap = false, silent = true })
			vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_gk)", { noremap = false, silent = true })
		end,
	},
})
