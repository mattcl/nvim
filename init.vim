" Plugins
call plug#begin()

Plug 'b4b4r07/vim-hcl'
Plug 'cespare/vim-toml'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dougireton/vim-chef'
Plug 'EdenEast/nightfox.nvim'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'FooSoft/vim-argwrap'
Plug 'glepnir/dashboard-nvim'
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'godlygeek/tabular'
Plug 'goldfeld/vim-seek'
Plug 'hoob3rt/lualine.nvim'
Plug 'jceb/vim-orgmode'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" order important for barbar/bufferline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kchmck/vim-coffee-script'
Plug 'Keithbsmiley/rspec.vim'
Plug 'kh3phr3n/python-syntax'
Plug 'lervag/vimtex'
" order important for gitsigns
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'Lokaltog/vim-easymotion'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'markcornick/vim-terraform'
Plug 'mattn/calendar-vim'
Plug 'mattn/emmet-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'metakirby5/codi.vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'mustache/vim-mustache-handlebars'
Plug 'myusuf3/numbers.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" keep this here
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'noprompt/vim-yardoc'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'preservim/vim-markdown'
Plug 'preservim/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'rodjek/vim-puppet'
Plug 'rust-lang/rust.vim'
" Plug 'sainnhe/sonokai'
Plug 'shawncplus/phpcomplete.vim'
Plug 'SirVer/ultisnips'
Plug 'SmiteshP/nvim-gps'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'Valloric/ListToggle'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/utl.vim'
Plug 'w0ng/vim-hybrid'
Plug 'wellle/targets.vim'

call plug#end()

" use comma as leader
let mapleader=','
let maplocalleader=','


" 50ms key sequence completion time
set ttimeoutlen=50

" make cursor hold 2 seconds instead of 4
set updatetime=300

" try-catch here to solve chicken and egg problem when chef installs plugins
" on a new machine
" set background=dark

" gruvbox-specific
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='medium'

" sonokai-specific
" let g:sonokai_style = 'andromeda'
" let g:sonokai_enable_italic = 1

" nightfox specific
set termguicolors

lua << EOF
require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
    },
    colors = {
      bg = "#131a24",
      bg_alt = "#0c1117",
      bg_float = "#192330",
      bg_highlight = "#1e2836",
      bg_popup = "#192330",
      bg_sidebar = "#0c1117",
      bg_statusline = "#0c1117",
      gitSigns = {
        change = "#86539e"
      }
    }
  }
})

vim.cmd("colorscheme nightfox")
EOF

try
  let g:gruvbox_guisp_fallback = "bg"
  " colorscheme nightfox
  " colorscheme gruvbox
  " colorscheme sonokai
catch
endtry

" cursorline with highlight at col 80
set cursorline

" color column
set colorcolumn=80
" nightfox ties this to the visual select, so just override specifically
hi ColorColumn ctermbg=1 guibg=#18212e

" indentlines
let g:indent_blankline_buftype_exclude = ['dashboard', 'terminal', 'vim', 'help']
let g:indent_blankline_filetype_exclude = ['dashboard', 'terminal', 'vim', 'help']
let g:indent_blankline_show_first_indent_level = v:false
" nightfox-specific indentline color
highlight IndentBlanklineChar guifg=#18212e gui=nocombine
nnoremap <silent> <leader>s :IndentBlanklineToggle<CR>

" Bein filetype specific settings
" spaces instead of tabs, etc
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
set expandtab
set spelllang=en_us
set spellsuggest=best,9
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype json setlocal ts=4 sts=4 sw=4
autocmd Filetype js setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype cucumber setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd Filetype org setlocal ts=2 sts=2 sw=2
autocmd Filetype hcl setlocal ts=2 sts=2 sw=2
autocmd Filetype java setlocal ts=4 sts=4 sw=4 colorcolumn=120
autocmd Filetype php set omnifunc=phpcomplete#CompletePHP
autocmd FileType rust setlocal commentstring=//\ %s
autocmd Filetype c setlocal ts=4 sts=4 sw=4
autocmd Filetype gitcommit setlocal colorcolumn=50,72

" set dispatch for file types
autocmd FileType python let b:dispatch = 'python %'
autocmd FileType ruby let b:dispatch = 'ruby %'
autocmd FileType puppet let b:dispatch = 'vagrant provision'
autocmd FileType eruby,html,css,js EmmetInstall

let g:pencil#conceallevel = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal_code_blocks = 0

augroup prose
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'hard', 'textwidth': 79})
                            \ | call litecorrect#init()
                            \ | setlocal spell spelllang=en_us
                            \ | setlocal spellcapcheck=
augroup END
" End filetype specific settings

" Remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" misc
set backspace=indent,eol,start
set wildmenu
set showcmd
set cmdheight=2
set laststatus=2
set mouse=a
set cindent

" misc Key Mappings
map Y y$
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Toggle pastemode with F9
set pastetoggle=<F9>

" Toggle spell checking with F11
nnoremap <silent> <F8> :set spell!<cr>
inoremap <silent> <F8> <C-O>:set spell!<cr>

nnoremap <silent> <F7> :<C-u>PFormatToggle<cr>
inoremap <silent> <F7> <C-o>:PFormatToggle<cr>

" Tabs
" set showtabline=2
" command T tabnew
" command TE tabe <q-args>

" Navigating splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Re-highlight after indent or outdent
vnoremap < <gv
vnoremap > >gv

" searching stuff
set ignorecase
set smartcase
set hlsearch
set incsearch
" center searches
nnoremap n nzz
nnoremap N Nzz

" commentary stuff that was removed, but I'm too used to the old keybindings
if maparg('\\','n') ==# '' && maparg('\','n') ==# '' && get(g:, 'commentary_map_backslash', 1)
  xmap \\  gc<CR>
  nmap \\  gc<CR>
  nmap \\\ gc<CR>
  nmap \\u gc<CR>
endif

" increment/decrement shortcuts
nnoremap + <C-a>
nnoremap - <C-x>

" show/hide invisible characters
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·
nnoremap <leader>i :set list!<cr>

" mappings for Tabular.vim
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>at :Tabularize /\|<CR>
vmap <Leader>at :Tabularize /\|<CR>
nmap <Leader>aa :Tabularize /=><CR>
vmap <Leader>aa :Tabularize /=><CR>
" Don't put two spaces between : and the value
nmap <Leader>a: :Tabularize /:\zs/l1c0<CR>
vmap <Leader>a: :Tabularize /:\zs/l1c0<CR>
nmap <Leader>a, :Tabularize /,\zs/l1c0<CR>
vmap <Leader>a, :Tabularize /,\zs/l1c0<CR>

" argwrap to split args to multiline or join
nnoremap <silent> <leader>c :ArgWrap<CR>

" fix ultisnips completions
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" Gitsigns, Lualine, Bufferline
lua << EOF
require("gitsigns").setup()
local gps = require("nvim-gps")
gps.setup {
  icons = {
    ["class-name"] = " ",
    ["function-name"] = " ",
    ["method-name"] = " ",
  }
}

require("lualine").setup {
  options = {
    theme = "nightfox"
  },
  sections = {
    lualine_c = {
      'filename',
      { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {
      {'diagnostics', sources = {"coc"}},
      'encoding',
      'fileformat',
      'filetype'
    },
  }
}

require('bufferline').setup {
  highlights = {
    buffer_selected = {
      gui = "NONE"
    }
  },
  options = {
    separator_style = "slant"
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  }
}
EOF

" Bufferline settings
" pick to go to
nnoremap <silent> gb :BufferLinePick<CR>

" pick to close
nnoremap <silent> gB :BufferLinePickClose<CR>

" cycle
nnoremap <silent> bn :BufferLineCycleNext<CR>
nnoremap <silent> bp :BufferLineCyclePrev<CR>

" move
nnoremap <silent> bN :BufferLineMoveNext<CR>
nnoremap <silent> bP :BufferLineMovePrev<CR>


" Sort automatically by...
nnoremap <silent> <Space>bb :BufferLineSortByDirectory<CR>

" Begin Coc settings, mostly lifted from their github page
" set hidden
" set shortmess+=c

set nobackup
set nowritebackup
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>b  <Plug>(coc-codeaction-selected)
nmap <leader>b  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>bc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Rust-specific
" toggle rust inlay hints
nnoremap <leader>w :call CocAction('runCommand', 'rust-analyzer.toggleInlayHints')<cr>
" hi CustInlayHint term=italic cterm=italic gui=italic ctermfg=DarkGray guifg=DarkGray guibg=NONE

" So these are sort of specific to nightfox. I need a more flexible way to
" specify these and allow changing themes
hi CustInlayHint term=italic cterm=italic gui=italic guifg=#4b364d guibg=NONE
hi CustChainInlayHint term=italic cterm=italic gui=italic guifg=#2f4259 guibg=NONE
hi link CocRustTypeHint CustInlayHint
hi link CocRustChainingHint CustChainInlayHint

" Coc lens text
hi CocCodeLens term=italic gui=italic guifg=#3d7e80
" {error = ' ', warn = ' ', info = ' '}
" Warnings, Errors, Info
hi CocErrorSign                     guifg=#c94f6d
hi CocErrorVirtualText   gui=italic guifg=#c94f6d

hi CocWarningSign                   guifg=#f4a261
hi CocWarningVirtualText gui=italic guifg=#f4a261

" WTF is using conceal here by default supposed to accomplish?
hi link CocUnusedHighlight CocWarningVirtualText

" End Coc settings

" Bein FZF
set rtp+=~/.fzf

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

function FuzzyFind()
  " Contains a null-byte that is stripped.
  let gitparent=system('git rev-parse --show-toplevel')[:-2]

  " search for .fzf files
  if empty(matchstr(gitparent, '^fatal:.*'))
    let fzf_marker_stop_dir=gitparent
  else
    let fzf_marker_stop_dir=''
  endif
  let fzf_marker=findfile('.fzf', '.;' . fzf_marker_stop_dir)

  " if a .fzf file exists, it overrides the git repo
  if !empty(fzf_marker)
    execute ':FZF ' . fnamemodify(fzf_marker, ':p:h')
  elseif empty(matchstr(gitparent, '^fatal:.*'))
    execute ':FZF ' . gitparent
  else
    execute ':FZF .'
  endif
endfunction

nmap <c-p> :call FuzzyFind()<cr>
nmap <leader>g :Lines<cr>
nnoremap <silent> <c-i> :Buffers<CR>
" End FZF settings

" python interpreter
let g:python3_host_prog = '/home/matt/.virtualenvs/neovim/bin/python'

" dashboard
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_header =<< trim END
██████╗  ██████╗ ███╗   ██╗████████╗    ██████╗  █████╗ ███╗   ██╗██╗ ██████╗
██╔══██╗██╔═══██╗████╗  ██║╚══██╔══╝    ██╔══██╗██╔══██╗████╗  ██║██║██╔════╝
██║  ██║██║   ██║██╔██╗ ██║   ██║       ██████╔╝███████║██╔██╗ ██║██║██║
██║  ██║██║   ██║██║╚██╗██║   ██║       ██╔═══╝ ██╔══██║██║╚██╗██║██║██║
██████╔╝╚██████╔╝██║ ╚████║   ██║       ██║     ██║  ██║██║ ╚████║██║╚██████╗
╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝       ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝ ╚═════╝
END

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" :hi default CocUnderline cterm=underline gui=underline


" sigh.... https://github.com/neovim/neovim/issues/9019. Issue has been
" open since 2018
runtime hl_bg_fix.lua
