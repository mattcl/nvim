local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.g.rustaceanvim = {
    server = {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
            vim.keymap.set(
                "n",
                "<Leader>x",
                function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end
            )
        end,
        default_settings = {
            ['rust-analyzer'] = {
                diagnostics = {
                    enable = true,
                    disabled = {"proc-macro-disabled", "unresolved-proc-macro"},
                },
                procMacro = {
                    ignored = {
                        ["tracing-attributes"] = {"instrument"},
                    },
                },
            },
        },
    }
}
