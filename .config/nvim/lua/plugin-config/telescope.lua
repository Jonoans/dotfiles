local status, telescope = pcall(require, 'telescope')
if not status then
    return
end
telescope.setup({
    extensions = {
        file_browser = {
            hijack_netrw = true
        }
    }
})
telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'
