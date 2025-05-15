return {
	{
		"mason-org/mason.nvim",
		version = "^1.0.0",
		config = function()
			require("mason").setup()
		end
	},
	{
		"mason-org/mason-lspconfig.nvim",
		version = "^1.0.0",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp"
		},
		config = function()
			local ensure_installed = { "lua_ls", "gopls", "clangd", "rust_analyzer", "pyright" }
			require('mason-lspconfig').setup({
				ensure_installed = ensure_installed,

			})
			for _, server in pairs(ensure_installed) do
				require('lspconfig')[server].setup({
					capabilities = require('cmp_nvim_lsp').default_capabilities()
				})
			end

		end	
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			 'neovim/nvim-lspconfig',
			 'hrsh7th/cmp-nvim-lsp',
			 'hrsh7th/cmp-buffer',
			 'hrsh7th/cmp-path',
			 'hrsh7th/cmp-cmdline',
			 'L3MON4D3/LuaSnip',
			 'saadparwaiz1/cmp_luasnip'
		},
		config = function()
			local cmp = require('cmp')

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end
				},
				window = {},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<CR>'] = cmp.mapping.confirm({ select = true })
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }
				}, {
					{ name = 'buffer' }
				})
			})

			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
				}, {
					{ name = 'cmdline' }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})
		end
	}
}
