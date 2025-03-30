vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('opt')

local function lspAttach(client, bufnr)
	vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<Cr>', { noremap = true, silent = true })
	vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<Cr>', { noremap = true, silent = true })
end

vim.lsp.config('*', {
	on_attach = lspAttach
})
vim.lsp.config['pylsp'] = {
	cmd = { 'pipenv', 'run', 'pylsp' },
	filetypes = { 'python' },
	root_markers = { 'Pipfile' },
	settings = {
		pylsp = {
			plugins = {
				pylsp_mypy = {
					live_mode = true,
					mypy_command = 'pipenv run mypy'
				},
			},
		},
	},
}
vim.lsp.enable('pylsp')


vim.keymap.set('i', '<C-Space>', '<C-X><C-O>', { noremap = true })

-- delete without yank
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- center screen actions
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- using the clipboard
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')

local vimToTmux = { ['k'] = 'U', ['j'] = 'D', ['h'] = 'L', ['l'] = 'R' }
local function switchPane(direction)
	local wNr = vim.api.nvim_win_get_number(0)
	vim.cmd.wincmd(direction)
	if wNr == vim.api.nvim_win_get_number(0) then
		os.execute('tmux select-pane -' .. vimToTmux[direction])
	end
end

vim.keymap.set('n', '<C-k>', function() switchPane('k') end, { silent = true })
vim.keymap.set('n', '<C-j>', function() switchPane('j') end, { silent = true })
vim.keymap.set('n', '<C-h>', function() switchPane('h') end, { silent = true })
vim.keymap.set('n', '<C-l>', function() switchPane('l') end, { silent = true })
