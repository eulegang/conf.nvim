vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })
vim.pack.add({ 'https://github.com/nvim-tree/nvim-web-devicons' })
vim.pack.add({ "https://github.com/nvim-telescope/telescope-ui-select.nvim" })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<c-g>', builtin.live_grep, { desc = 'Telescope live grep' })


require("telescope").setup({
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

require("telescope").load_extension("ui-select")
