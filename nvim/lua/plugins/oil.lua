return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({})
	end,
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
}
