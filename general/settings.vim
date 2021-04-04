set nocompatible
filetype plugin on
syntax on

let mapleader = " "

let g:python_host_prog = "$HOME/.config/nvim/venv2/bin/python"
let g:python3_host_prog = "$HOME/.config/nvim/venv/bin/python3"

set number
set relativenumber

set nowrap
"set nrformats+=alpha

" case insensitive search and completion
" for strict case search append \C
set ignorecase 

augroup tex
	autocmd BufRead,BufNewFile *.tex setlocal wrap spell
augroup END

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

let $FZF_DEFAULT_COMMAND='ag --hidden --ignore={venv,.git} -g ""'
