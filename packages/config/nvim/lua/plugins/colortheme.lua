return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha")
	end,

	-- Dracula
	-- "Mofiqul/dracula.nvim",
	-- config = function()
	--     vim.cmd([[
	--         colorscheme dracula
	--         colorscheme dracula_pro
	--     ]])
	-- end
}
