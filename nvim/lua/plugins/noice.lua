return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- "nvim-notify",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({})
		end,
	},
}
