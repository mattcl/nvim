vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set(
                "n",
                "<Leader>x",
                function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end
            )
        end,
    }
}
