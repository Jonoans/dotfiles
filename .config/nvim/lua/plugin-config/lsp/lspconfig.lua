local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap
local on_attach = function(client, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set('n', 'gf', '<Cmd>Lspsaga lsp_finder<CR>', opts) -- show definition, references
    keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- got to declaration
    keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', opts) -- see definition and make edits in window
    keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
    keymap.set('n', '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts) -- see available code actions
    keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts) -- smart rename
    keymap.set('n', '<leader>D', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts) -- show  diagnostics for line
    keymap.set('n', '<leader>d', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', opts) -- show diagnostics for cursor
    keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts) -- jump to previous diagnostic in buffer
    keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts) -- jump to next diagnostic in buffer
    keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
    keymap.set('i', '<C-k>', '<C-o><Cmd>Lspsaga hover_doc<CR>', opts) -- show documentation for what is under cursor
    keymap.set('n', '<leader>o', '<Cmd>LSoutlineToggle<CR>', opts) -- see outline on right hand side
    keymap.set('n', '<space>f', '<Cmd>lua vim.lsp.buf.format()<CR>', opts)

    if client.name == 'tsserver' then
        client.server_capabilities.documentFormattingProvider = false
    end
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local clangd_capabilities = cmp_nvim_lsp.default_capabilities()
clangd_capabilities.offsetEncoding = { 'utf-16' }

-- language servers
lspconfig.clangd.setup {
    capabilities = clangd_capabilities,
    on_attach = on_attach,
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto', 'arduino' },
}
lspconfig.cssls.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.gopls.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.html.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.pyright.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.stdpath 'config' .. '/lua'] = true,
                },
            },
        },
    },
}
lspconfig.tsserver.setup { capabilities = capabilities, on_attach = on_attach }
