return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")
		-- dashboard.section.header.val = {
		-- 	[[                                                     ]],
		-- 	[[                                                     ]],
		-- 	[[ _____ ______________  ________ _   _   ___   _      ]],
		-- 	[[|_   _|  ___| ___ \  \/  |_   _| \ | | / _ \ | |     ]],
		-- 	[[  | | | |__ | |_/ / .  . | | | |  \| |/ /_\ \| |     ]],
		-- 	[[  | | |  __||    /| |\/| | | | | . ` ||  _  || |     ]],
		-- 	[[  | | | |___| |\ \| |  | |_| |_| |\  || | | || |____ ]],
		-- 	[[  \_/ \____/\_| \_\_|  |_/\___/\_| \_/\_| |_/\_____/ ]],
		-- 	[[                                                     ]],
		-- 	[[                                                     ]],
		-- }
		alpha.setup(dashboard.opts)
		vim.keymap.set("n", "<C-a>", ":Alpha<CR>")
	end,
}
