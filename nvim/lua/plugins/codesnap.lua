return {
	{
		"mistricky/codesnap.nvim",
		build = "make build_generator",
		config = function()
			require("codesnap").setup({
				save_path = "~/CodeSnapSave",
				border = "rounded",
				has_breadcrumbs = true,
				bg_theme = "grape",
				watermark = "",
			})
			vim.keymap.set("v", "<leader>cc", "<CMD>CodeSnap<CR>")
			vim.keymap.set("v", "<leader>cs", "<CMD>CodeSnapSave<CR>")
		end,
	},
}
