return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { desc = desc })
			end

			map("<leader>ma", function()
				harpoon:list():add()
			end, "Harpoon Add File")
			map("<leader>mm", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, "Harpoon Menu")

			map("<leader>m1", function()
				harpoon:list():select(1)
			end, "Harpoon File 1")
			map("<leader>m2", function()
				harpoon:list():select(2)
			end, "Harpoon File 2")
			map("<leader>m3", function()
				harpoon:list():select(3)
			end, "Harpoon File 3")
			map("<leader>m4", function()
				harpoon:list():select(4)
			end, "Harpoon File 4")

			-- Toggle previous & next buffers stored within Harpoon list
			map("<leader>mp", function()
				harpoon:list():prev()
			end, "Harpoon Previous")
			map("<leader>mn", function()
				harpoon:list():next()
			end, "Harpoon Next")
		end,
	},
}
