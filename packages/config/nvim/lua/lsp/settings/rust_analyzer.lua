return {
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			lens = {
				enable = true,
			},
		},
	},
	checkOnSave = {
		command = "clippy",
	},
}
