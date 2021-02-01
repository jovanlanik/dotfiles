" Jovan Lanik's nvim config 1.0
" www.github.com/jovanlanik
" clean and simple

set number
set autoindent
set laststatus=1
set guicursor=
set cino=(s,U1,m1
highlight LineNr ctermfg=cyan

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '=>'
let g:NERDTreeDirArrowCollapsible = '->'

