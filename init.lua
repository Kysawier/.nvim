local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>t", vim.cmd.Ex)

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


local options = {
    cmdheight = 2, -- neovim command line spaces (under your editing space) 
    conceallevel = 0, -- shows `` in markdonw files
    fileencoding = "utf-8", -- setting encoding 

    guicursor = "",
    cursorline = true, -- highlights line on which you are rn

--    guifont = "Hack:h17", -- font used in nvim apps

    nu = true,
    relativenumber = false,

    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
    showtabline = 1, -- show tabs
    expandtab = true, -- tabs into spaces
    smartindent = true, -- smarter indent
    smartcase = true, -- smart case 
    autoindent = true,
    cindent = true,
    splitright = true, -- all vertical splits are on the right side
    splitbelow = true, -- all horizontal splits are below

    wrap = false,

    swapfile = false,
    backup = false, -- Creates a buckup file
    undofile = true, --persisten undo

    hlsearch = true, -- highlights searches after searched pattern
    ignorecase = true, -- ignore case sensitivity in search 
    incsearch = true,

    termguicolors = true,
    pumheight = 10, -- pop up menu height
    -- vim.opt.showmode = false -- hides in which mode are you in rn

    scrolloff = 8,
    signcolumn = "yes",

    updatetime = 50,
    colorcolumn = "0",


}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.isfname:append("@-@")
vim.opt.shortmess:append "c"

vim.o.clipboard = "unnamedplus"

