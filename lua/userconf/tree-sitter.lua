vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter' }

-- vim.filetype.add({
-- 	extension = {
-- 		ll = "llvm",
-- 	},
-- })
--


require('nvim-treesitter').setup {
	highlight = {
		enable = true, -- MUST BE TRUE
	},
}

require('nvim-treesitter').install { 'rust', 'javascript', 'zig', 'odin', 'llvm' }
vim.treesitter.language.register("llvm", "llvm")

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'llvm' },
	callback = function() vim.treesitter.start() end,
})
