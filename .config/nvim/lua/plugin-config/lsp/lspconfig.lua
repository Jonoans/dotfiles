local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status then
    return
end

local keymap = vim.keymap
local on_attach = function(_, bufnr)
    -- keybind options
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    keymap.set("n", "gf", ":Lspsaga lsp_finder<CR>", opts) -- show definition, references
    keymap.set("n", "gD", ":lua lsp.buf.declaration()<CR>", opts) -- got to declaration
    keymap.set("n", "gd", ":Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
    keymap.set("n", "gi", ":lua lsp.buf.implementation()<CR>", opts) -- go to implementation
    keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", opts) -- see available code actions
    keymap.set("n", "<leader>rn", ":Lspsaga rename<CR>", opts) -- smart rename
    keymap.set("n", "<leader>D", ":Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
    keymap.set("n", "<leader>d", ":Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
    keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
    keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
    keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    keymap.set("i", "<C-k>", "<C-o>:Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
    keymap.set("n", "<leader>o", ":LSoutlineToggle<CR>", opts) -- see outline on right hand side
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- language servers
lspconfig.html.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.gopls.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.cssls.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.sumneko_lua.setup {
    capabilities = capabilities, on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.stdpath('config') .. '/lua'] = true
                },
            }
        }
    }
}
