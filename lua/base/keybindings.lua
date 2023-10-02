local ks = vim.keymap.set

--[[ yank entire line with Y --]]
ks('n', 'Y', 'y$')
ks('v', 'Y', 'y$')
ks('o', 'Y', 'y$')

--[[ toggle indentation markers --]]
ks('n', '<leader>s', ':IndentBlanklineToggle<cr>', {noremap = true, silent = true})

--[[ toggle spell checking --]]
ks('n', '<F8>', ':set spell!<cr>',      {noremap = true, silent = true})
ks('i', '<F8>', '<C-O>:set spell!<cr>', {noremap = true, silent = true})

--[[ toggle pencil auto-formatting --]]
ks('n', '<F7>', ':<C-u>PFormatToggle<cr>', {noremap = true, silent = true})
ks('i', '<F7>', '<C-o>:PFormatToggle<cr>', {noremap = true, silent = true})

--[[ re-highlight selection when applying indent/outdent --]]
ks('v', '<', '<gv', {noremap = true})
ks('v', '>', '>gv', {noremap = true})

--[[ center search results --]]
ks('n', 'n', 'nzz', {noremap = true}) -- next result
ks('n', 'N', 'Nzz', {noremap = true}) -- prev result

--[[ increment/decrement numeric values --]]
ks('n', '+', '<C-a>', {noremap = true}) -- increase
ks('n', '-', '<C-a>', {noremap = true}) -- decrease

--[[ toggle listchars --]]
ks('n', '<leader>i', ':set list!<cr>', {noremap = true, silent = true})

--[[ tabularize aligning --]]
ks('n', '<Leader>a=', ':Tabularize /=<cr>')          -- align on =
ks('v', '<Leader>a=', ':Tabularize /=<cr>')          -- align on =
ks('n', '<Leader>at', ':Tabularize /\\|<cr>')        -- align on |
ks('v', '<Leader>at', ':Tabularize /\\|<cr>')        -- align on |
ks('n', '<Leader>aa', ':Tabularize /=><cr>')         -- align on =>
ks('v', '<Leader>aa', ':Tabularize /=><cr>')         -- align on =>
ks('n', '<Leader>a-', ':Tabularize /--<cr>')         -- align on --
ks('v', '<Leader>a-', ':Tabularize /--<cr>')         -- align on --
ks('n', '<Leader>a:', ':Tabularize /:\\zs/l1c0<cr>') -- align on :
ks('v', '<Leader>a:', ':Tabularize /:\\zs/l1c0<cr>') -- align on :
ks('n', '<Leader>a,', ':Tabularize /,\\zs/l1c0<cr>') -- align on ,
ks('v', '<Leader>a,', ':Tabularize /,\\zs/l1c0<cr>') -- align on ,

--[[ wrap/unwrap args --]]
ks('n', '<leader>c', ':ArgWrap<cr>', {noremap = true, silent = true})

--[[ buffer navigation/manipulation --]]
ks('n', 'gb',        ':BufferLinePick<cr>',            {noremap = true, silent = true}) -- pick buffer to focus
ks('n', 'gB',        ':BufferLinePickClose<cr>',       {noremap = true, silent = true}) -- pick buffer to close
ks('n', 'bn',        ':BufferLineCycleNext<cr>',       {noremap = true, silent = true}) -- next buffer
ks('n', 'bp',        ':BufferLineCyclePrev<cr>',       {noremap = true, silent = true}) -- prev buffer
ks('n', 'bN',        ':BufferLineMoveNext<cr>',        {noremap = true, silent = true}) -- move buffer right
ks('n', 'bP',        ':BufferLineMovePrev<cr>',        {noremap = true, silent = true}) -- move buffer left
ks('n', '<Space>bb', ':BufferLineSortByDirectory<cr>', {noremap = true, silent = true}) -- sort buffers

--[[ telescope ]]--
local builtin = require('telescope.builtin')

ks('n', '<c-p>',      builtin.find_files,                {}) -- open file
ks('n', '<leader>ff', builtin.current_buffer_fuzzy_find, {}) -- find in file
ks('n', '<leader>fg', builtin.live_grep,                 {}) -- grep in workdir
ks('n', '<leader>fb', builtin.buffers,                   {}) -- find buffer
