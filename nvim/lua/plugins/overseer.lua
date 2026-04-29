return {
	"stevearc/overseer.nvim",
	cmd = {
		"OverseerRun",
		"OverseerToggle",
		"OverseerQuickAction",
		"OverseerTaskAction",
	},
	keys = {
		{ "<leader>oo", "<cmd>OverseerToggle<CR>", desc = "Toggle Tasks" },
		{ "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run Task" },
		{ "<leader>oa", "<cmd>OverseerTaskAction<CR>", desc = "Task Action" },
		{ "<leader>ot", "<cmd>OverseerQuickAction<CR>", desc = "Task Quick Action" },
	},
	opts = {},
}
