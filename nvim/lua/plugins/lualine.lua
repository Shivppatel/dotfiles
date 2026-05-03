return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			bg = "#16161e",
			bg_highlight = "#292e42",
			blue = "#7aa2f7",
			comment = "#565f89",
			fg = "#c0caf5",
			fg_dark = "#a9b1d6",
			green = "#9ece6a",
			orange = "#ff9e64",
			purple = "#bb9af7",
			red = "#f7768e",
			yellow = "#e0af68",
			black = "#15161e",
		}

		local theme = {
			normal = {
				a = { fg = colors.black, bg = colors.blue, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg_highlight },
				c = { fg = colors.fg_dark, bg = colors.bg },
			},
			insert = {
				a = { fg = colors.black, bg = colors.green, gui = "bold" },
			},
			visual = {
				a = { fg = colors.black, bg = colors.purple, gui = "bold" },
			},
			replace = {
				a = { fg = colors.black, bg = colors.red, gui = "bold" },
			},
			command = {
				a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
			},
			inactive = {
				a = { fg = colors.comment, bg = colors.bg },
				b = { fg = colors.comment, bg = colors.bg },
				c = { fg = colors.comment, bg = colors.bg },
			},
		}

		require("lualine").setup({
			options = {
				theme = theme,
				icons_enabled = true,
				component_separators = { left = "│", right = "│" },
				section_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diff",
						symbols = { added = "+", modified = "~", removed = "-" },
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " *",
							readonly = " ro",
							unnamed = "[No Name]",
						},
					},
				},
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = colors.orange },
					},
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = colors.orange },
					},
					{
						"diagnostics",
						symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
					},
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
