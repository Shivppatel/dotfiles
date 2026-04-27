return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "ts-main")
			local ts = require("nvim-treesitter")

			ts.setup({
				install_dir = install_dir,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"c",
					"cpp",
					"css",
					"csv",
					"dockerfile",
					"go",
					"gotmpl",
					"graphql",
					"haskell",
					"hcl",
					"helm",
					"html",
					"htmldjango",
					"java",
					"javascript",
					"javascriptreact",
					"json",
					"lua",
					"make",
					"markdown",
					"ocaml",
					"prisma",
					"python",
					"query",
					"rust",
					"scala",
					"sh",
					"sql",
					"terraform",
					"typescript",
					"typescriptreact",
					"vim",
					"yaml",
				},
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {},
	},
}
