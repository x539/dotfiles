local fzfScript = '/usr/share/doc/fzf/examples/fzf.vim'
if vim.fn.filereadable(fzfScript) == 0 then
	return
end

vim.cmd("source " .. fzfScript)

vim.keymap.set('n', '<C-P>', ':FZF<CR>')
