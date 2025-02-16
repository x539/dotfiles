-- vim.o.nocompatible = true

vim.o.ruler = true
vim.o.number = true

vim.o.title = true
vim.o.showcmd = true
vim.o.termguicolors = true
vim.o.hlsearch = true

-- Use tabs for indent
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.noexpandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.autoread = true

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'python',
	callback = function(args)
		vim.lsp.start({
			name = 'pylsp',
			cmd = {'pipenv','run','pylsp'},
			root_dir = vim.fs.dirname(vim.fs.find({'Pipfile'}, {upward = true})[1]),
		})
	end,
})

-- Display tabs and trailing spaces
vim.o.list = true
vim.o.listchars = 'tab:• ,trail:‡'

-- Color
vim.cmd('syntax enable')
vim.cmd('colorscheme desert')

vim.o.spell = true
vim.o.spelllang = 'en_us'

vim.cmd('highlight WhiteSpaceError term=underline ctermfg=Red ctermbg=DarkRed guifg=Red guibg=DarkRed')
vim.fn.matchadd('WhiteSpaceError', '\\s\\+$\\| \\+\\ze\\t\\|[^\\t\\"]\\t\\+')

-- Enable Cursor Line
vim.o.cursorline = true
