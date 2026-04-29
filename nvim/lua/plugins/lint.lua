return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "InsertLeave" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			dockerfile = { "hadolint" },
			python = { "ruff" },
			sql = { "sqlfluff" },
			["yaml.ansible"] = { "ansible_lint" },
		}

		if lint.linters.sqlfluff then
			lint.linters.sqlfluff.args = { "lint", "--format=json", "--dialect", "postgres", "-" }
		end

		local function try_lint()
			lint.try_lint()

			local filename = vim.api.nvim_buf_get_name(0)
			if filename:match("/%.github/workflows/.*%.ya?ml$") then
				lint.try_lint("actionlint")
			end
		end

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = try_lint,
		})

		vim.keymap.set("n", "<leader>cl", try_lint, { desc = "Lint Current Buffer" })
	end,
}
