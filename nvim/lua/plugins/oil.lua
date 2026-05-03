return {
	"stevearc/oil.nvim",
	opts = {
		watch_for_changes = true,
		win_options = {
			winbar = "%!v:lua.oil_winbar()",
		},
		view_options = {
			show_hidden = true,
		},
	},
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
	config = function(_, opts)
		_G.oil_winbar = function()
			local dir = require("oil").get_current_dir()
			if dir == nil then
				return ""
			end

			return vim.fn.fnamemodify(dir, ":~")
		end

		require("oil").setup(opts)
	end,
}
