local status, null_ls = pcall(require, 'null-ls')
if not status then
    return
end

local augroup = vim.api.nvim_create_augroup('NullLsFormatting', {})
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup {
    sources = {
        formatting.clang_format.with {
            extra_filetypes = { 'arduino' },
            extra_args = function(params)
                return params.options and {
                    '--style',
                    '{BasedOnStyle: llvm, IndentWidth: 4}',
                }
            end,
        },
        formatting.gofmt,
        formatting.prettierd.with {
            env = {
                PRETTIERD_DEFAULT_CONFIG = vim.fn.expand '~/.config/.prettierrc.json',
            },
        },
        formatting.stylua,
        diagnostics.eslint_d,
    },
    -- on_attach = function(client, bufnr)
    --     if client.supports_method 'textDocument/formatting' then
    --         vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    --         vim.api.nvim_create_autocmd('BufWritePre', {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 vim.lsp.buf.format {
    --                     bufnr = bufnr,
    --                     filter = function(clt)
    --                         return clt.name == 'null-ls'
    --                     end,
    --                 }
    --             end,
    --         })
    --     end
    -- end,
}
