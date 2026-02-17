vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require('opt')
require('tmux')
require('fzf')

vim.opt.updatetime = 500

vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<Cr>', { noremap = true, silent = true })
		vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<Cr>', { noremap = true, silent = true })

		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if client:supports_method('textDocument/implementation') then
			-- Create a keymap for vim.lsp.buf.implementation ...
			vim.keymap.set('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<Cr>', { noremap = true, silent = true })
		end
		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			-- client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
		end

		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if not client:supports_method('textDocument/willSaveWaitUntil') and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
		        end,
			})
		end

		if client:supports_method('textDocument/documentHighlight') then
			vim.api.nvim_create_autocmd({'CursorHold','CursorHoldI'}, {
				callback = function(ev)
					vim.lsp.buf.document_highlight()
				end
			})
			vim.api.nvim_create_autocmd({'CursorMoved'}, {
				callback = function(ev)
					vim.lsp.buf.clear_references()
				end
			})
		end
	end,
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

vim.filetype.add({
	filename = {
		['docker-compose.yaml'] = 'yaml.docker-compose',
		['docker-compose.yml'] = 'yaml.docker-compose',
	},
})

vim.lsp.enable({'rust_analyzer','docker_language_server', 'kotlin_lsp'})


vim.keymap.set('i', '<C-Space>', '<C-X><C-O>', { noremap = true })

vim.keymap.set('n', '<leader>e', ':Lex 30<cr>', { noremap = true, silent = true })

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
