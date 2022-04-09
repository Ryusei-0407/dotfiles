local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
		formatting.stylua,
		formatting.rustfmt,
		formatting.goimports,
		formatting.golines,
		formatting.terraform_fmt,
        formatting.sqlformat,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
		end
	end,
})
