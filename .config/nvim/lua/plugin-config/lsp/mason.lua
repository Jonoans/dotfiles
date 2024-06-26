local mason_status, mason = pcall(require, 'mason')
if not mason_status then
    return
end

local mason_lspcfg_status, mason_lspcfg = pcall(require, 'mason-lspconfig')
if not mason_lspcfg_status then
    return
end

local mason_null_ls_status, mason_null_ls = pcall(require, 'mason-null-ls')
if not mason_null_ls_status then
    return
end

mason.setup()
mason_lspcfg.setup {
    ensure_installed = {
        'clangd',
        'cssls',
        'gopls',
        'graphql',
        'html',
        'lua_ls',
        'pyright',
        'tsserver',
    },
    automatic_installation = true,
}

mason_null_ls.setup {
    ensure_installed = {
        'eslint_d',
        'gofmt',
        'prettierd',
        'stylua',
    },
}
