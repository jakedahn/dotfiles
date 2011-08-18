" Use Vim settings, rather than Vi settings
filetype on
filetype plugin on
set backspace=2
set nocompatible
set modeline
set textwidth=120

" syntax highlighting
syntax on

" indenting
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab "turns tabs into whitespace

" folding
set foldmethod=marker " use {{{ }}} as delimiters
highlight Folded term=bold ctermfg=white ctermbg=black

" search
set incsearch " search as you type
set hlsearch

" Have 3 lines of offset (or buffer) when scrolling
set scrolloff=3

" automagically remove whitespace from end of line
autocmd BufWritePre *.py :%s/\s\+$//e
