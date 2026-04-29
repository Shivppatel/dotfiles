return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = { "n", "v" },
			desc = "Format",
		},
	},
	opts = {
		formatters_by_ft = {
			go = { "goimports", "gofumpt" },
			hcl = { "terraform_fmt" },
			java = { "google-java-format" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
			sql = { "sqlfluff" },
			terraform = { "terraform_fmt" },
			toml = { "taplo" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = function(bufnr)
			local disabled_filetypes = {
				java = true,
			}

			return {
				timeout_ms = 3000,
				lsp_format = disabled_filetypes[vim.bo[bufnr].filetype] and "never" or "fallback",
			}
		end,
		formatters = {
			sqlfluff = {
				prepend_args = { "--dialect", "postgres" },
			},
		},
	},
}
