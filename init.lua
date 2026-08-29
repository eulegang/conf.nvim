vim.g.mapleader = " "

-- vim.filetype.add({
-- 	extension = {
-- 		ll = "llvm",
-- 	},
-- })
--
-- vim.treesitter.language.register("llvm", "llvm")
--

require("userconf")

vim.o.number = true
vim.o.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = "unnamedplus"
