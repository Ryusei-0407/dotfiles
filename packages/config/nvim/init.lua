require("config.options")
require("config.keymaps")
require("config.loader")

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
	spec = {
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				colorscheme = "catppuccin",
			},
		},
		{ import = "lazyvim.plugins.extras.coding.mini-surround" },
		{ import = "lazyvim.plugins.extras.coding.mini-comment" },
		{ import = "lazyvim.plugins.extras.editor.neo-tree" },
		{ import = "lazyvim.plugins.extras.editor.telescope" },
		{ import = "lazyvim.plugins.extras.ui.smear-cursor" },
		{ import = "lazyvim.plugins.extras.ui.treesitter-context" },
		{ import = "lazyvim.plugins.extras.lang.markdown" },
		{ import = "lazyvim.plugins.extras.lang.json" },
		{ import = "lazyvim.plugins.extras.lang.rust" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "lazyvim.plugins.extras.lang.typescript" },
		{ import = "lazyvim.plugins.extras.ai.copilot" },
		{ import = "lazyvim.plugins.extras.ai.copilot-chat" },
		{ import = "lazyvim.plugins.extras.formatting.biome" },
		{ import = "plugins.claude-code" },
		{ import = "plugins.toggleterm" },
		{ import = "plugins.incline" },
	},
	-- require("plugins.mini"),
	-- require("plugins.barbar"),
	-- require("plugins.lualine"),
	-- require("plugins.incline"),
	-- require("plugins.neo-tree"),
	-- require("plugins.colortheme"),
	-- require("plugins.telescope"),
	-- require("plugins.windows"),
	-- require("plugins.toggleterm"),
	-- require("plugins.nvim-lspconfig"),
	-- require("plugins.lspsaga"),
	-- require("plugins.copilotchat"),
	-- require("plugins.nvim-cmp"),
	-- require("plugins.nvim-ts-autotag"),
	-- require("plugins.nvim-treesitter"),
	-- require("plugins.gitsigns"),
	-- require("plugins.todo-comments"),
})
