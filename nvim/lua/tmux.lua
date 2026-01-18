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
