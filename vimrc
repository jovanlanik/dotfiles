" Jovan Lanik's vim config 1.0
" www.github.com/jovanlanik
" clean and simple

set nocompatible
filetype plugin on
set number
highlight LineNr ctermfg=cyan
set autoindent
set viminfo+=n~/.vim/viminfo
syntax on
cmap ` w !sudo tee > /dev/null %

set directory=~/.cache/vim,/tmp
set backupdir=~/.cache/vim,/tmp
set viminfo+=n~/.cache/vim/viminfo
set runtimepath=$HOME/.local/share/vim,$HOME/.local/share/vim/after,$VIM,$VIMRUNTIME
let g:netrw_home='~/.cache/vim'
