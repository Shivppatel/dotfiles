return {
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
				"c",
				"dockerfile",
				"graphql",
				"go",
				"haskell",
				"html",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"ocaml",
				"prisma",
				"python",
				"query",
				"rust",
				"sql",
				"typescript",
				"tsx",
				"vim",
				"vimdoc",
				"yaml",
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
}
