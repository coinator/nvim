set nocompatible
set hidden
filetype plugin on
filetype plugin indent on
syntax on

let mapleader = " "

let g:python_host_prog = "$HOME/.config/nvim/venv2/bin/python"
let g:python3_host_prog = "$HOME/.config/nvim/venv/bin/python3"

set number
set relativenumber
set numberwidth=1

set nowrap
"set nrformats+=alpha

" case insensitive search and completion
" for strict case search append \C
set ignorecase

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif


set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

let $FZF_DEFAULT_COMMAND='ag --hidden --ignore={venv,.git} -g ""'

function! Chomp(string)
    return substitute(a:string, '\n\+$', '', '')
endfunction

let g:neoterm_autoscroll=1
if $VIRTUAL_ENV != ""
  let g:neoterm_repl_python = Chomp(system('which jupyter')) . ' console'
endif
" correctly paste indents
augroup PythonREPL
  autocmd!
  autocmd BufEnter *.py let g:neoterm_bracketed_paste = 1
  autocmd BufLeave *.py let g:neoterm_bracketed_paste = 0
augroup end
