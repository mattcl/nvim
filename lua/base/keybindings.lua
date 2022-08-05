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

--[[ navigating between splits --]]
ks('n', '<C-h>', '<C-w>h', {noremap = true}) -- focus left
ks('n', '<C-j>', '<C-w>j', {noremap = true}) -- focus lower
ks('n', '<C-k>', '<C-w>k', {noremap = true}) -- focus upper
ks('n', '<C-l>', '<C-w>l', {noremap = true}) -- focus right

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
ks('n', '<Leader>at', ':Tabularize /\\|<cr>')       -- align on |
ks('v', '<Leader>at', ':Tabularize /\\|<cr>')       -- align on |
ks('n', '<Leader>aa', ':Tabularize /=><cr>')        -- align on =>
ks('v', '<Leader>aa', ':Tabularize /=><cr>')        -- align on =>
ks('n', '<Leader>a-', ':Tabularize /--<cr>')        -- align on --
ks('v', '<Leader>a-', ':Tabularize /--<cr>')        -- align on --
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

--[[ fzf bindings --]]
ks('n', '<c-p>',     ':call FuzzyFind()<cr>', {silent = true}) -- open file
ks('n', '<leader>g', ':Lines<cr>',            {silent = true}) -- navigate to line

--[[ coc.nvim bindings --]]
-- tab cycles completion
ks(
    'i',
    '<TAB>',
    'coc#pum#visible() ? coc#pum#next(1): CheckBackspace() ? "\\<Tab>" : coc#refresh()',
    {noremap = true, silent = true, expr = true}
)
ks(
    'i',
    '<S-TAB>',
    'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"',
    {noremap = true, expr = true}
)

-- enter selects completion
ks(
    'i',
    '<CR>',
    [[coc#pum#visible() ? coc#pum#confirm(): "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
    {noremap = true, silent = true, expr = true}
)

ks('i', '<c-space>', 'coc#refresh()', {noremap = true, silent = true, expr = true}) -- trigger completions

ks('n', '[g', '<Plug>(coc-diagnostic-prev)',   {silent = true})
ks('n', ']g', '<Plug>(coc-diagnostic-next)',   {silent = true})
ks('n', 'gd', '<Plug>(coc-definition)',        {silent = true})
ks('n', 'gy', '<Plug>(coc-type-definition)',   {silent = true})
ks('n', 'gi', '<Plug>(coc-implementation)',    {silent = true})
ks('n', 'gr', '<Plug>(coc-references)',        {silent = true})
ks('n', 'K',  ':call ShowDocumentation()<cr>', {noremap = true, silent = true})

ks('n', '<leader>rn', '<Plug>(coc-rename)')
ks('x', '<leader>f',  '<Plug>(coc-format-selected)')
ks('n', '<leader>f',  '<Plug>(coc-format-selected)')
ks('x', '<leader>b',  '<Plug>(coc-codeaction-selected)')
ks('n', '<leader>b',  '<Plug>(coc-codeaction-selected)')
ks('n', '<leader>bc', '<Plug>(coc-codeaction)')
ks('n', '<leader>qf', '<Plug>(coc-fix-current)')
ks('x', 'if',         '<Plug>(coc-funcobj-i)')
ks('o', 'if',         '<Plug>(coc-funcobj-i)')
ks('x', 'af',         '<Plug>(coc-funcobj-a)')
ks('o', 'af',         '<Plug>(coc-funcobj-a)')
ks('x', 'ic',         '<Plug>(coc-classobj-i)')
ks('o', 'ic',         '<Plug>(coc-classobj-i)')
ks('x', 'ac',         '<Plug>(coc-classobj-a)')
ks('o', 'ac',         '<Plug>(coc-classobj-a)')

ks(
  'n',
  '<C-f>',
  'coc#float#has_scroll() ? coc#float#scroll(1) : "\\<C-f>"',
  {noremap = true, silent = true, expr = true, nowait = true}
)

ks(
  'i',
  '<C-f>',
  'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(1)\\<cr>" : "\\<Right>"',
  {noremap = true, silent = true, expr = true, nowait = true}
)

ks(
  'v',
  '<C-f>',
  'coc#float#has_scroll() ? coc#float#scroll(1) : "\\<C-f>"',
  {noremap = true, silent = true, expr = true, nowait = true}
)

ks(
  'n',
  '<C-b>',
  'coc#float#has_scroll() ? coc#float#scroll(0) : "\\<C-b>"',
  {noremap = true, silent = true, expr = true, nowait = true}
)

ks(
  'i',
  '<C-b>',
  'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(0)\\<cr>" : "\\<Left>"',
  {noremap = true, silent = true, expr = true, nowait = true}
)

ks(
  'v',
  '<C-b>',
  'coc#float#has_scroll() ? coc#float#scroll(0) : "\\<C-b>"',
  {noremap = true, silent = true, expr = true, nowait = true}
)

ks('n', '<C-s>', '<Plug>(coc-range-select)', {silent = true})
ks('x', '<C-s>', '<Plug>(coc-range-select)', {silent = true})

ks('n', '<space>a', ':<C-u>CocList diagnistics<cr>', {noremap = true, silent = true, nowait = true})
ks('n', '<space>e', ':<C-u>CocList extensions<cr>',  {noremap = true, silent = true, nowait = true})
ks('n', '<space>c', ':<C-u>CocList commands<cr>',    {noremap = true, silent = true, nowait = true})
ks('n', '<space>o', ':<C-u>CocList outline<cr>',     {noremap = true, silent = true, nowait = true})
ks('n', '<space>s', ':<C-u>CocList -I symbols<cr>',  {noremap = true, silent = true, nowait = true})
ks('n', '<space>j', ':<C-u>CocNext<cr>',             {noremap = true, silent = true, nowait = true})
ks('n', '<space>k', ':<C-u>CocPrev<cr>',             {noremap = true, silent = true, nowait = true})
ks('n', '<space>p', ':<C-u>CocListResume<cr>',       {noremap = true, silent = true, nowait = true})

ks('n', '<leader>w', ':call CocAction("runCommand", "rust-analyzer.toggleInlayHints")<cr>', {noremap = true, silent = true})
