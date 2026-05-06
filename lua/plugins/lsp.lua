-- Setup language servers.
-- local lspconfig = require('lspconfig')

-- local lsp_defaults = lspconfig.util.default_config

-- lsp_defaults.capabilities = vim.tbl_deep_extend(
--     'force',
--     lsp_defaults.capabilities,
--     require('cmp_nvim_lsp').default_capabilities()
-- )
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                flake8 = {
                    ignore = {"E203"},
                    extendIgnore = {"E203"},
                    maxLineLength = 120,
                },
                pycodestyle = {
                    ignore = {"E203"},
                    maxLineLength = 120,
                },
                pyflakes = {
                    enabled = false,
                },
                jedi_completion = {
                    include_params = true,
                },
            },
        },
    },
})
-- lspconfig.rust_analyzer.setup {}
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }

vim.lsp.enable('bashls')
vim.lsp.enable('biome')
vim.lsp.enable('lua_ls')
vim.lsp.enable('pylsp')
vim.lsp.enable('solargraph')
vim.lsp.enable('taplo')
vim.lsp.enable('yamlls')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', function()
        require('fzf-lua').lsp_code_actions{
            winops = {
                relative = 'cursor',
                width = 0.6,
                height = 0.6,
                row = 1,
                preview = { vertical = 'up:70%' },
            }
        }
    end,opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>F', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
