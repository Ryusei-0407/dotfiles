local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	sync_install = true,
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "lua" },
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	yati = { enable = true },
	context_commentstring = {
		enable = true,
	},
})
