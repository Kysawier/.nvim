
local plugins = {
"MunifTanjim/nui.nvim",
"nvim-lua/plenary.nvim",
{
"mbbill/undotree",
cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
},
{
"neoclide/coc.nvim",
branch = "release",
lazy = false,
},
}


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)


require("lazy").setup(plugins, {
 defaults = { lazy = true },
 install = { colorscheme = { "tokyonight" } },
 checker = { enabled = true },
 change_detection = {
  notify = false,
 },
})

require('coc-config')
