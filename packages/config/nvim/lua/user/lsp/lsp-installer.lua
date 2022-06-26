local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("user.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "yamlls" then
		local yamlls_opts = require("user.lsp.settings.yamlls")
		opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
	end

	if server.name == "bashls" then
		local bashls_opts = require("user.lsp.settings.bashls")
		opts = vim.tbl_deep_extend("force", bashls_opts, opts)
	end

	if server.name == "dockerls" then
		local dockerls_opts = require("user.lsp.settings.dockerls")
		opts = vim.tbl_deep_extend("force", dockerls_opts, opts)
	end

	if server.name == "rls" then
		local rls_opts = require("user.lsp.settings.rls")
		opts = vim.tab_deep_extend("force", rls_opts, opts)
	end

	if server.name == "rust_analyzer" then
		local rust_analyzer_opts = require("user.lsp.settings.rust_analyzer")
	end

	if server.name == "tsserver" then
		local tsserver_opts = require("user.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end

	if server.name == "tflint" then
		local tflint_opts = require("user.lsp.settings.tflint")
		opts = vim.tbl_deep_extend("force", tflint_opts, opts)
	end

	if server.name == "svelte" then
		local svelte_opts = require("user.lsp.settings.svelte")
	end

	if server.name == "tailwindcss" then
		local tailwindcss_opts = require("user.lsp.settings.tailwindcss")
		opts = vim.tbl_deep_extend("force", tailwindcss_opts, opts)
	end

	if server.name == "eslint" then
		local eslint_opts = require("user.lsp.settings.eslint")
		opts = vim.tbl_deep_extend("force", eslint_opts, opts)
	end

	if server.name == "graphql" then
		local graphql_opts = require("user.lsp.settings.graphql")
		opts = vim.tbl_deep_extend("force", graphql_opts, opts)
	end

	if server.name == "solidity_ls" then
		local solidity_ls_opts = require("user.lsp.settings.solidity_ls")
		opts = vim.tbl_deep_extend("force", solidity_ls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("user.lsp.settings.pyright")
		opts = vim.tbl_deep_extends("force", pyright_opts, opts)
	end

	if server.name == "gopls" then
		local gopls_opts = require("user.lsp.settings.gopls")
		opts = vim.tbl_deep_extend("force", gopls_opts, opts)
	end

	if server.name == "golangci_lint_ls" then
		local golangci_lint_ls_opts = require("user.lsp.settings.golangci_lint_ls")
		opts = vim.tbl_deep_extend("force", golangci_lint_ls_opts, opts)
	end

	if server.name == "dartls" then
		local dartls_opts = require("user.lsp.settings.dartls")
		opts = vim.tbl_deep_extend("force", dartls_opts, opts)
	end

	if server.name == "terraformls" then
		local terraformls_opts = require("user.lsp.settings.terraformls")
		opts = vim.tbl_deep_extend("force", terraformls_opts, opts)
	end

	server:setup(opts)
end)
