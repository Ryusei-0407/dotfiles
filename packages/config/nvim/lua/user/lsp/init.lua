local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("rust-tools").setup()
require("rust-tools.inlay_hints").set_inlay_hints()
require("user.lsp.null-ls")
