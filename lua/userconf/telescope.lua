vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })
vim.pack.add({ 'https://github.com/nvim-tree/nvim-web-devicons' })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<c-g>', builtin.live_grep, { desc = 'Telescope live grep' })
