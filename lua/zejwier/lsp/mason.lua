local servers = {
    "lua_ls",
    "pyright",
    "jsonls",
    "bashls",
    "cssls",
    "sqlls",
    "html",
    "tsserver",
}
--local

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "I",
            package_pending = "P",
            package_uninstalled = "X",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,

}

require('mason').setup(settings)
require('mason-lspconfig').setup({
    ensure_installed = servers,
    automatic_installation = true,
})


local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    vim.notify('lspconfig didn`t worked')
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require('zejwier.lsp.handlers').on_attach,
        capabilities = require('zejwier.lsp.handlers').capabilities,
    }

    server = vim.split(server, '@')[1]

    local require_ok, conf_opts = pcall(require, 'settings')
    if require_ok then 
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end


    lspconfig[server].setup(opts)

end

--vim.cmd([[
--augroup deatch_lsp_on_buffer_change 
--    autocmd!
--    autocmd BufWinEnter * lua detach_on_buffer_change()
--augroup END
--]])
