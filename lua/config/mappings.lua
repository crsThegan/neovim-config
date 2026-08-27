vim.keymap.set('n', '<leader>qq', ':Ex<cr>')
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '<Esc>', ":noh<cr>")

-- lsp_signature.nvim
vim.keymap.set({ 'n' }, '<leader>m', function()
	require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })

vim.keymap.set({ 'n' }, '<Leader>k', function()
	vim.lsp.buf.signature_help()
end, { silent = true, noremap = true, desc = 'toggle signature' })
