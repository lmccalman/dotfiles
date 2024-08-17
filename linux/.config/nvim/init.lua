-- for reference:
-- https://github.com/wimstefan/dotfiles/blob/master/config/nvim/lua/plugins/misc.lua
-- :TSInstall python rust toml typescript bash dockerfile html json latex css vim 

vim.g.mapleader = ","
vim.g.maplocalleader = " "

require("config.lazy")
require("config.options")
require("config.keymaps")

