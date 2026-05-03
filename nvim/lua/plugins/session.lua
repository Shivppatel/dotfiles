return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save Session" },
		{ "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Restore Session" },
		{ "<leader>wa", "<cmd>SessionSearch<CR>", desc = "Search Sessions" },
	},
	opts = {
		log_level = "error",
		auto_restore = false,
		bypass_save_filetypes = {
			"snacks_dashboard",
			"oil",
		},
		pre_save_cmds = {
			function()
				for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
					if vim.bo[bufnr].filetype == "oil" then
						vim.api.nvim_buf_delete(bufnr, { force = true })
					end
				end
			end,
		},
		suppressed_dirs = {
			"~/",
			"~/Downloads",
			"/",
		},
	},
}
