local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end
mason.setup()

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

mason_lspconfig.setup_handlers({
	function(server)
		local opt = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
		}
		require("lspconfig")[server].setup(opt)
	end,
})

local keymap = vim.keymap.set

keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "ga", "<cmd>Lspsaga code_action<CR>")
keymap("n", "gn", "<cmd>Lspsaga rename<CR>")
keymap("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

vim.cmd([[
    highlight LspReferenceText cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
    highlight LspReferenceRead cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
    highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
    augroup lsp_document_highlight
        autocmd!
        autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
    augroup END
]])
