return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gotmpl" },
	root_dir = root_pattern("go.mod", ".git"),
}
