vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("ols")
vim.lsp.enable("rust_analyzer")


vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach-format", { clear = true }),
	callback = function(args)
		local client_id = args.data.client_id
		local client = vim.lsp.get_client_by_id(client_id)
		local bufnr = args.buf

		local opts = { buffer = args.buf }

		-- Only set up format-on-save if the LSP supports document formatting
		if client and client:supports_method("textDocument/formatting", bufnr) then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						id = client_id,
					})
				end,
			})
		end

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
		vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)

		if client ~= nil then
			local caps = client.capabilities
			caps = vim.tbl_deep_extend('force', caps, require('blink.cmp').get_lsp_capabilities({}, false))

			client.capabilities = vim.tbl_deep_extend('force', caps, {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true
					}
				}
			})
		end
	end,
})
