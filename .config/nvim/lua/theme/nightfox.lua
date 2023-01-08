local status, nightfox = pcall(require, 'nightfox')
if not status then
    return
end
nightfox.setup {
    groups = {
        nightfox = {
            Whitespace = { fg = '#555555' },
        },
    },
}
vim.cmd 'colorscheme nightfox'
require 'theme.tabby'
