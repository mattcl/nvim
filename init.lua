-- init/load vim-plug
require('plugin_init')

-- first set all options
require('base/options')

-- then load autocommands
require('base/autocommands')

-- plugin customizations
require('plugins/bufferline')
require('plugins/mason')
require('plugins/lsp')
require('plugins/rust_tools')
require('plugins/cmp')
require('plugins/luasnip')
require('plugins/commentary')
require('plugins/dashboard')
require('plugins/indent')
require('plugins/lualine')
require('plugins/markdown')
require('plugins/nightfox')
require('plugins/tree')

-- then remaining colors
require('base/colors')

-- lastly keybindings
require('base/keybindings')
