vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.bo.cindent = true
		vim.bo.smartindent = false
		vim.bo.indentexpr = ""
	end,
})
