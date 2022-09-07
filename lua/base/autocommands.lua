local autocmd = vim.api.nvim_create_autocmd
local opt_local = vim.opt_local

local function set_tabs(width)
    opt_local.tabstop = width
    opt_local.shiftwidth = width
    opt_local.softtabstop = width
end

-- trim trailing spaces on write
autocmd('BufWritePre', {
    pattern = '*',
    command = ':%s/\\s\\+$//e'
})

-- override for languages that are 2-space tabs
autocmd('FileType', {pattern = 'js',         callback = function() set_tabs(2) end})
autocmd('FileType', {pattern = 'typescript', callback = function() set_tabs(2) end})
autocmd('FileType', {pattern = 'eruby',      callback = function() set_tabs(2) end})
autocmd('FileType', {pattern = 'yaml',       callback = function() set_tabs(2) end})
autocmd('FileType', {pattern = 'org',        callback = function() set_tabs(2) end})
autocmd('FileType', {pattern = 'hcl',        callback = function() set_tabs(2) end})

-- git commits have two colorcolumns for the summary and the body
autocmd('FileType', {
    pattern = 'gitcommit',
    callback = function()
        opt_local.colorcolumn = {'50', '72'}
    end
})

autocmd('FileType', {
    pattern = 'rust',
    callback = function()
        opt_local.commentstring = '// %s'
    end
})

autocmd('FileType', {
    pattern = 'go',
    callback = function()
        set_tabs(8)
        -- sigh
        opt_local.expandtab = false
    end
})

autocmd('FileType', {
    pattern = 'java',
    callback = function()
        opt_local.colorcolumn = '120'
    end
})

local prose = vim.api.nvim_create_augroup("Prose", {clear = true})

autocmd('FileType', {
    pattern = {'markdown', 'md'},
    group = prose,
    callback = function()
        vim.call('pencil#init', {wrap = 'hard', textwidth = 79})
        vim.call('litecorrect#init')
        opt_local.spell = true
        opt_local.spelllang = 'en_us'
    end
})

autocmd({"BufRead", "BufNewFile"}, {
    pattern = 'Jenkinsfile',
    callback = function()
        opt_local.filetype = 'groovy'
    end
})
