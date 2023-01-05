vim.g.mapleader = ' '

local keymap = vim.keymap
-- general keymaps
keymap.set('n', '<Leader>wq', ':wq<CR>')
keymap.set('n', '<Leader>q', ':q!<CR>')
keymap.set('i', '<C->>', '<C-o>l')
keymap.set('i', '<C-<>', '<C-o>h')

-- split windows
keymap.set('n', '<Leader>sv', '<C-w>v')
keymap.set('n', '<Leader>sh', '<C-w>s')
keymap.set('n', '<Leader>se', '<C-w>=')
keymap.set('n', '<Leader>sq', ':close<CR>')

-- tabs
keymap.set('n', '<Leader>tn', ':tabnew<CR>')
keymap.set('n', '<Leader>tq', ':tabclose<CR>')
keymap.set('n', '<Leader>t>', ':tabn<CR>')
keymap.set('n', '<Leader>t<lt>', ':tabp<CR>')

-- telescope-file-browser
keymap.set('n', '<Leader>eb', ':NvimTreeToggle<CR>')
keymap.set("n", "<Leader>ex", ":Telescope file_browser hidden=true<CR>")
keymap.set("n", "<Leader>ef", ":Telescope find_files hidden=true<CR>")
keymap.set("n", "<Leader>es", ":Telescope live_grep hidden=true<CR>")
keymap.set("n", "<Leader>ec", ":Telescope grep_string hidden=true<CR>")
