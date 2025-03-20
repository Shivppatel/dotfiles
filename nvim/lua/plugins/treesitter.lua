return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"bash",
					"css",
					"csv",
					"cpp",
					"dockerfile",
					"graphql",
					"go",
					"gotmpl",
					"haskell",
                    "hcl",
                    "helm",
					"html",
					"htmldjango",
					"java",
					"javascript",
					"json",
					"latex",
					"lua",
					"make",
					"markdown",
					"markdown_inline",
					"ocaml",
					"prisma",
					"python",
					"query",
					"rust",
                    "scala",
					"sql",
					"terraform",
					"typescript",
					"tsx",
					"vim",
					"vimdoc",
					"yaml",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {},
	},
}
