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
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ansiblels",
                    "bashls",
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
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            local servers = {
                "ansiblels",
                "bashls",
                "gopls",
                "helm_ls",
                "html",
                "jdtls",
                "jsonls",
                "lua_ls",
                "markdown_oxide",
                "pyright",
                "rust_analyzer",
                "sqls",
                "tailwindcss",
                "terraformls",
                "ts_ls",
                "yamlls",
            }

            -- Define configuration for all servers
            for _, server in ipairs(servers) do
                vim.lsp.config(server, { capabilities = capabilities })
            end

            -- Enable servers
            vim.lsp.enable(servers)

            -- LSP Keymaps (Buffer-local)
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = { buffer = args.buf }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                end,
            })

            -- Trigger code completion (Global)
            vim.keymap.set("n", "<C-Space>", "<C-x><C-o>", {})
        end,
    },
}
