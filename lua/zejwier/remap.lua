local opts = { noremap = true, silent = true }

vim.g.mapleader = " "


function detach_on_buffer_change()
    local clients = vim.lsp.buf_get_clients(0);
    if clients then
        for _, client in ipairs(clients) do
            vim.lsp.buf_detach_client(0, client)
        end
    end
end


local function netrw_use()
    vim.cmd([[Ex]])
    vim.cmd([[LspStop]])
    --vim.lsp.stop_client(vim.lsp.get_active_clients())
    --detach_on_buffer_change()
end

vim.keymap.set("n", "<leader>t", netrw_use)

vim.keymap.set("i", "jk", "<Esc>")

-- pozwala na przesuanie tekstu
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- wyniki wyszukiwania są wyśrodkowane
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- doesn't copy a text after paste over the text
vim.keymap.set("v", "p", "_dP", opts)

-- Usuwanie do void
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")


-- for navigation between screens
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- resizing screens
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- for repeating manual indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)


