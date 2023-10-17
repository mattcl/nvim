require('nightfox').setup({
    modules = {
        indent_blankline = {},
    },
    options = {
        styles = {
            comments = "italic",
            constants = "italic",
        },
    },
    palettes = {
        all = {
            bg0 = "#0c1117",
            bg1 = "#131a24",
            bg3 = "#1e2836",
        }
    },
    specs = {
        all = {
            git = {
                changed = '#86539e'
            }
        }
    },
})
