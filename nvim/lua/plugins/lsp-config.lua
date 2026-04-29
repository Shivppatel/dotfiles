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
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ansiblels",
					"bashls",
					"dockerls",
					"lua_ls",
					"gopls",
					"helm_ls",
					"html",
					"jdtls",
					"jsonls",
					"markdown_oxide",
					"pyright",
					"rust_analyzer",
					"sqls",
					"tailwindcss",
					"taplo",
					"terraformls",
					"ts_ls",
					"yamlls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "b0o/SchemaStore.nvim" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			local schemastore = require("schemastore")
			local servers = {
				ansiblels = {},
				bashls = {},
				dockerls = {},
				gopls = {},
				helm_ls = {},
				html = {},
				jsonls = {
					settings = {
						json = {
							schemas = schemastore.json.schemas(),
							validate = { enable = true },
						},
					},
				},
				lua_ls = {},
				markdown_oxide = {},
				pyright = {},
				rust_analyzer = {},
				sqls = {},
				tailwindcss = {},
				taplo = {},
				terraformls = {},
				ts_ls = {},
				yamlls = {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							schemas = schemastore.yaml.schemas({
								extra = {
									{
										name = "Kubernetes",
										description = "Kubernetes manifests",
										fileMatch = {
											"k8s/**/*.yaml",
											"k8s/**/*.yml",
											"kubernetes/**/*.yaml",
											"kubernetes/**/*.yml",
											"*.k8s.yaml",
											"*.k8s.yml",
										},
										url = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
									},
									{
										name = "Argo CD",
										description = "Argo CD custom resources",
										fileMatch = {
											"argocd/**/*.yaml",
											"argocd/**/*.yml",
											"*argocd*.yaml",
											"*argocd*.yml",
										},
										url = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/main/schema/argo_all_k8s_kustomize_schema.json",
									},
								},
							}),
							validate = true,
							completion = true,
							hover = true,
							keyOrdering = false,
						},
					},
				},
			}

			-- Define configuration for all servers
			for server, config in pairs(servers) do
				config.capabilities = capabilities
				vim.lsp.config(server, config)
			end

			-- Enable servers
			vim.lsp.enable(vim.tbl_keys(servers))

			-- LSP Keymaps (Buffer-local)
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local function map(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
					end

					map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
					map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
					map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("n", "<leader>cr", vim.lsp.buf.rename, "Rename Symbol")
					map({ "n", "v" }, "<leader>cf", function()
						local ok, conform = pcall(require, "conform")
						if ok then
							conform.format({ async = true, lsp_format = "fallback" })
						else
							vim.lsp.buf.format({ async = true })
						end
					end, "Format")
					map("n", "[d", function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, "Previous Diagnostic")
					map("n", "]d", function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, "Next Diagnostic")
					map("n", "<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
				end,
			})
		end,
	},
}
