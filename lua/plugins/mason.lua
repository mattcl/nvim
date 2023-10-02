require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "biome",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "taplo",
        "tsserver",
        "typst_lsp",
        "yamlls",
    }
}
