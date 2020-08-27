let g:python_host_prog = "$HOME/.config/nvim/venv2/bin/python"
let g:python3_host_prog = "$HOME/.config/nvim/venv/bin/python3"

set nowrap

nnoremap : ;
nnoremap ; :

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

nnoremap gs :Gstatus <CR> G

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l

autocmd termOpen * nnoremap <buffer> <Up> a<Up>
tnoremap gt <C-\><C-N>gt

let g:vimspector_enable_mappings = 'HUMAN'
