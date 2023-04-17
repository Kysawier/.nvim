local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("lspconfig is not installed")
    return
end

require('zejwier.lsp.mason')
require('zejwier.lsp.handlers').setup()
require('zejwier.lsp.null-ls')
