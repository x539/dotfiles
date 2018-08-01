set nocompatible

set ruler number
set title

set showcmd
set termguicolors
set hlsearch

" Use tabs for indent
set tabstop=4 shiftwidth=4 softtabstop=0 noexpandtab
set autoindent smartindent

set autoread


" Display tabs an trailing spaces
set list listchars=tab:•\ ,trail:‡

" Color
syntax on
colorscheme torte
highlight SpellBad ctermbg=Black ctermfg=DarkRed cterm=undercurl
highlight SpellCap ctermbg=Black ctermfg=DarkBlue cterm=undercurl

highlight WhiteSpaceError term=bold ctermfg=Red
match WhiteSpaceError "\s\+$\| \+\ze\t\|[^\t\"]\t\+"

" Enable CursorLine
set cursorline
"highlight clear CursorLine
highlight CursorLine ctermbg=233

"highlight Visual ctermbg=235


call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flowtype/vim-flow'
call plug#end()
" Plugin 'powerline.vim'

let g:deoplete#enable_at_startup = 1
