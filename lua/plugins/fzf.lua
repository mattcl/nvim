require('fzf-lua').setup({
    lsp = {
        code_actions = {
            previewer = 'codeaction_native',
        }
    },
    previewers = {
        codeaction_native = {
            diff_opts = { ctxlen = 3 },
            -- git-delta is automatically detected as pager, set `pager=false`
            -- to disable, can also be set under 'lsp.code_actions.preview_pager'
            -- recommended styling for delta
            pager = [[delta --syntax-theme="Dracula" --width=$COLUMNS --hunk-header-style="omit" --file-style="omit"]],
        },
    }
})
-- local telescope = require("telescope")

-- telescope.setup({
--     extensions = {
--         fzf = {
--             fuzzy = true,                    -- false will only do exact matching
--             override_generic_sorter = true,  -- override the generic sorter
--             override_file_sorter = true,     -- override the file sorter
--             case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--         },
--         ["ui-select"] = {
--             require("telescope.themes").get_dropdown {}
--         }

--     }
-- })

-- require("telescope").load_extension("fzf")
-- require("telescope").load_extension("ui-select")
