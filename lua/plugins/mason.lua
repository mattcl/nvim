require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "biome",
        "lua_ls",
        "pylsp",
        -- makes duplicates with rustacean
        -- "rust_analyzer",
        "taplo",
        "tinymist",
        "ts_ls",
        "yamlls",
    }
}
