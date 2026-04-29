return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	cmd = { "MasonToolsInstall", "MasonToolsInstallSync", "MasonToolsUpdate" },
	event = "VeryLazy",
	opts = {
		ensure_installed = {
			"actionlint",
			"gofumpt",
			"goimports",
			"golines",
			"google-java-format",
			"hadolint",
			"prettier",
			"ruff",
			"sqlfluff",
			"stylua",
			"taplo",
		},
		auto_update = false,
		run_on_start = true,
		start_delay = 3000,
	},
}
