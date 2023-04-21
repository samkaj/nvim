require('plugins')
require('remap')
require('github-theme').setup()
require("mason").setup()

local set = vim.opt
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.number = true
set.relativenumber = true
