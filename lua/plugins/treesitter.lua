-- lua/plugins/treesitter.lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,

		config = function()
			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			local langs = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"bash",
				"json",
				"yaml",
				"python",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"go",
			}

			require("nvim-treesitter").install(langs)

			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local lang = vim.treesitter.language.get_lang(args.match)
					if lang and vim.tbl_contains(langs, lang) then
						vim.treesitter.start(args.buf, lang)
					end
				end,
			})
		end,
	},
}
