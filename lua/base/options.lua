local g = vim.g
local opt = vim.opt

g.mapleader                                = ","
g.maplocalleader                           = ","
g.UltiSnipsExpandTrigger                   = "<C-j>"
g.UltiSnipsJumpForwardTrigger              = "<C-j>"
g.UltiSnipsJumpBackwardTrigger             = "<C-k>"
g.python3_host_prog                        = os.getenv('NVIM_PYTHON_HOST_PROG')
g.dashboard_default_executive              = 'fzf'

-- change how listchars are displayed
opt.listchars={tab = '▸\\ ', eol = '¬', extends = '❯', precedes = '❮', trail = '·'}

opt.ttimeoutlen   = 50                         -- 50 ms for sequence completion
opt.updatetime    = 300                        -- make cursorhold 300 ms
opt.shiftwidth    = 4                          -- default amount to shift by
opt.tabstop       = 4                          -- default tab width
opt.softtabstop   = 4                          -- default tab width
opt.expandtab     = true                       -- use spaces instead of tabs
opt.autoindent    = true                       -- automatically indent
opt.spelllang     = 'en_us'                    -- this is probably best-fit
opt.spellsuggest  = {'best' ,'9'}              -- limit to 9 spelling suggestions
opt.backspace     = {'indent', 'eol', 'start'} -- allow bs traversal over indents, lines, and cursor start
opt.wildmenu      = true                       -- enable better completion for command-line tab complete
opt.showcmd       = true                       -- show partial command in last line of screen
opt.cmdheight     = 2                          -- more room for command displaying
opt.laststatus    = 2                          -- always show status line
opt.mouse         = 'a'                        -- enable mouse mode
opt.cindent       = true                       -- more "intelligent" indenting
opt.pastetoggle   = '<F9>'                     -- toggle pastemode with F9
opt.ignorecase    = true                       -- search ignores case
opt.smartcase     = true                       -- unless there is an uppercase character
opt.hlsearch      = true                       -- highlight searches
opt.incsearch     = true                       -- search is incremental
opt.backup        = false                      -- no backups
opt.writebackup   = false                      -- no backups
opt.signcolumn    = 'yes'                      -- always display the sign column
opt.termguicolors = true                       -- required by nightfox
opt.cursorline    = true                       -- highlight the line with the cursor
opt.colorcolumn   = "80"                       -- indicate 80 chars by coloring column

--[[
We're just explicitly setting 'inverse' here, but it's not necessary since it's
the default. If I _do_ need to change this, it's nice to have this block here.
--]]
opt.guicursor = {
    "n-v-c-sm:block-inverse",
    "i-ci-ve:ver25-inverse",
    "r-cr-o:hor20-inverse",
}

-- configure diagnostic icons
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
