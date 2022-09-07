local cmd = vim.cmd

cmd("colorscheme nightfox")
cmd("hi ColorColumn ctermbg=1 guibg=#18212e")

-- So these are sort of specific to nightfox. I need a more flexible way to
-- specify these and allow changing themes
cmd("hi CustInlayHint term=italic cterm=italic gui=italic guifg=#4b364d guibg=NONE")
cmd("hi CustChainInlayHint term=italic cterm=italic gui=italic guifg=#2f4259 guibg=NONE")
cmd("hi link CocRustTypeHint CustInlayHint")
cmd("hi link CocRustChainingHint CustChainInlayHint")

-- Coc lens text
cmd("hi CocInlayHint term=italic gui=italic guifg=#613f4f guibg=NONE")
-- {error = ' ', warn = ' ', info = ' '}
-- Warnings, Errors, Info
cmd("hi CocErrorSign                     guifg=#c94f6d")
cmd("hi CocErrorVirtualText   gui=italic guifg=#c94f6d")
cmd("hi CocWarningSign                   guifg=#f4a261")
cmd("hi CocWarningVirtualText gui=italic guifg=#f4a261")

-- WTF is using conceal here by default supposed to accomplish?
cmd("hi link CocUnusedHighlight CocWarningVirtualText")
