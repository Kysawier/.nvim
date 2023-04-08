local options = {
    cmdheight = 2, -- neovim command line spaces (under your editing space) 
    conceallevel = 0, -- shows `` in markdonw files
    fileencoding = "utf-8", -- setting encoding 

    guicursor = "",
    cursorline = true, -- highlights line on which you are rn

    guifont = "monospace:h17", -- font used in nvim apps

    nu = true,
    relativenumber = false,

    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
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
    undodir = os.getenv("HOME") .. "/.nvim/undodir",
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

