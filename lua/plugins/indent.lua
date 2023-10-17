require("ibl").setup {
    exclude = {
        filetypes = {"dashboard", "terminal", "vim", "help"},
        buftypes = {"dashboard", "terminal", "vim", "help"},
    },
    whitespace = {
        highlight = {"Whitespace"},
    },
    indent = {
        highlight = {"Whitespace"},
    },
    scope = {
        highlight = {"Label"},
    }
}
