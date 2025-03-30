vim.opt.ruler = true
vim.opt.number = true
vim.wo.relativenumber = true

vim.opt.number = true

vim.opt.title = true
vim.opt.showcmd = true
vim.opt.termguicolors = true
vim.opt.hlsearch = true

-- Use tabs for indent
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.autoindent = true
vim.opt.smartindent = true

-- 
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Auto reload external changed files
vim.opt.autoread = true

-- Display tabs and trailing spaces
vim.opt.list = true
vim.opt.listchars = { tab = '• ', trail = '‡', nbsp = '␣' }

-- Enable Cursor Line
vim.opt.cursorline = true

-- Enable Spellchecking
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

vim.opt.scrolloff = 10

-- Color
vim.cmd('syntax enable')
vim.cmd('colorscheme desert')


vim.cmd('highlight WhiteSpaceError term=underline ctermfg=Red ctermbg=DarkRed guifg=Red guibg=DarkRed')
vim.fn.matchadd('WhiteSpaceError', '\\s\\+$\\| \\+\\ze\\t\\|[^\\t\\"]\\t\\+')
