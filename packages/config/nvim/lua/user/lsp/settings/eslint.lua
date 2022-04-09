return {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	settings = {
		codeAction = {
			disableRuleComment = {
				enable = true,
				location = "separateLine",
			},
			showDocumentation = {
				enable = true,
			},
			codeActionOnSave = {
				enable = false,
				mode = "all",
			},
			format = true,
			onIgnoredFiles = "off",
			quiet = false,
			rulesCustomizations = {},
			run = "onType",
			useESLintClass = false,
			validate = "on",
		},
	},
}
