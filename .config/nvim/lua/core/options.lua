local opt = vim.opt

opt.encoding = 'utf-8'
opt.listchars = 'tab:» ,extends:›,precedes:‹,nbsp:·,trail:·'
opt.relativenumber = true
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

opt.cursorline = true
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

opt.backspace = 'indent,eol,start'
opt.clipboard:append('unnamedplus')

opt.splitright = true
opt.splitbelow = true
