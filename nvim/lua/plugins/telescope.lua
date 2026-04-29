return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep Word" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
			vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Find Registers" })
			vim.keymap.set("n", "<leader>fkm", builtin.keymaps, { desc = "Find Keymaps" })
			vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Find Commands" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
			vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to Definition" })
			vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to Implementation" })
			vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Go to References" })
			vim.keymap.set("n", "go", builtin.lsp_type_definitions, { desc = "Go to Type Definition" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							preview_width = 0.65,
							size = {
								width = "95%",
								height = "95%",
							},
						},
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
