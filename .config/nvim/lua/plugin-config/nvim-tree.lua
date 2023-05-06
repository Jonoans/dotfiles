local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
    return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvim_tree.setup {
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = '\u{f067}',
                    arrow_open = '\u{f068}'
                }
            }
        }
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false
            }
        }
    }
}
