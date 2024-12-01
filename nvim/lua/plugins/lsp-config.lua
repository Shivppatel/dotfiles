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
                    "lua_ls",
                    "gopls",
                    "helm_ls",
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
            local lspconfig = require("lspconfig")

            lspconfig.ansiblels.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.helm_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.jdtls.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.markdown_oxide.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.sqls.setup({
                capabilities = capabilities,
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })
            lspconfig.terraformls.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
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
