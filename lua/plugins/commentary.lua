vim.api.nvim_exec([[
" commentary stuff that was removed, but I'm too used to the old keybindings
if maparg('\\','n') ==# '' && maparg('\','n') ==# '' && get(g:, 'commentary_map_backslash', 1)
    xmap \\  gc<CR>
    nmap \\  gc<CR>
    nmap \\\ gc<CR>
    nmap \\u gc<CR>
endif
]], false)
