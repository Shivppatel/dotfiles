return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})
			lspconfig.dockerls.setup({
				capabilities = capabilities,
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.htmx.setup({
				capabilities = capabilities,
			})
			lspconfig.hls.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.sqlls.setup({
				capabilities = capabilities,
			})
			lspconfig.svelte.setup({
				capabilities = capabilities,
			})
			lspconfig.terraformls.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = {
					"rustup",
					"run",
					"stable",
					"rust-analyzer",
				},
			})
			-- Trigger code completion
			vim.keymap.set("n", "<C-Space>", "<C-x><C-o>", {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
			-- -- Displays a function's signature information
			-- bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
			-- Renames all references to the symbol under the cursor
			-- bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
		end,
	},
}
