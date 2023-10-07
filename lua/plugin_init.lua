local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug "rafamadriz/friendly-snippets"

Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.3' })

Plug 'b4b4r07/vim-hcl'
Plug 'cespare/vim-toml'
Plug 'dhruvasagar/vim-table-mode'
Plug 'dougireton/vim-chef'
Plug 'EdenEast/nightfox.nvim'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'FooSoft/vim-argwrap'
Plug('glepnir/dashboard-nvim', {['commit'] = 'f7d6234'})
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
Plug 'godlygeek/tabular'
Plug 'goldfeld/vim-seek'
Plug 'hoob3rt/lualine.nvim'
Plug 'jceb/vim-orgmode'
Plug 'jmcantrell/vim-virtualenv'
Plug 'jonathanfilip/vim-lucius'
-- Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'kaarmu/typst.vim'
-- order important for barbar/bufferline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kchmck/vim-coffee-script'
Plug 'Keithbsmiley/rspec.vim'
Plug 'kh3phr3n/python-syntax'
Plug 'lervag/vimtex'
-- order important for gitsigns
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'Lokaltog/vim-easymotion'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'mattn/calendar-vim'
Plug 'mattn/emmet-vim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'metakirby5/codi.vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'mustache/vim-mustache-handlebars'
Plug 'myusuf3/numbers.vim'
Plug 'NoahTheDuke/vim-just'
-- Plug('neoclide/coc.nvim', {branch= 'release'})
-- keep this here
-- Plug('antoinemadec/coc-fzf', {branch = 'release'})
Plug 'noprompt/vim-yardoc'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'preservim/vim-markdown'
-- Plug 'preservim/vim-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'rodjek/vim-puppet'
Plug 'rust-lang/rust.vim'
-- Plug 'sainnhe/sonokai'
Plug 'shawncplus/phpcomplete.vim'
-- Plug 'SirVer/ultisnips'
Plug 'stevearc/aerial.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
-- Plug 'tpope/vim-markdown'
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

vim.call('plug#end')
