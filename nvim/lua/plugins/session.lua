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
		auto_session_suppress_dirs = {
			"~/",
			"~/Downloads",
			"/",
		},
	},
}
