return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		keys = {
			{ "<Tab>", nil },
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"f3fora/cmp-spell",
			"ray-x/cmp-treesitter",
			"uga-rosa/cmp-dictionary",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "vim-dadbod-completion" },
					{ name = "emoji" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
			})
			-- local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
			-- vim.api.nvim_create_autocmd("FileType", {
			-- 	pattern = { "sql", "mysql", "plsql" },
			-- 	callback = function()
			-- 		cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
			-- 	end,
			-- 	group = autocomplete_group,
			-- })
		end,
	},
}
