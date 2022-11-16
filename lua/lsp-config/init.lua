local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "lsp-config.mason"
require("lsp-config.handlers").setup()
require "lsp-config.null-ls"

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)

