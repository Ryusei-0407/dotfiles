return {
	filetypes = {
		"css",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"svelte",
	},
	settings = {
		tailwindCSS = {
			classAttributes = {
				"class",
				"className",
				"classList",
				"ngClass",
			},
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidConfigPath = "error",
				invalidScreen = "error",
				invalidTailwindDirective = "error",
				invalidVariant = "error",
				recommendedVariantOrder = "warning",
			},
			validate = true,
		},
	},
}
