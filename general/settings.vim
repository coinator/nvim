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

autocmd BufRead,BufNewFile *.tex set wrap

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
