return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                require("none-ls.diagnostics.eslint_d"),
                -- null_ls.builtins.completion.luasnip,
                null_ls.builtins.diagnostics.actionlint,
                null_ls.builtins.diagnostics.ansiblelint,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.google_java_format,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.golines,
                null_ls.builtins.diagnostics.hadolint,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.sqlfluff.with({
                    extra_args = { "--dialect", "postgres" }, -- change to your dialect
                }),
                null_ls.builtins.diagnostics.sqlfluff.with({
                    extra_args = { "--dialect", "postgres" }, -- change to your dialect
                }),
                null_ls.builtins.diagnostics.checkstyle.with({
                    extra_args = { "-c", "/google_checks.xml" },
                }),
                null_ls.builtins.formatting.terraform_fmt,
            },
        })
    end,
}
