set termguicolors

let g:python_host_prog = "$HOME/.config/nvim/venv2/bin/python"
let g:python3_host_prog = "$HOME/.config/nvim/venv/bin/python3"

nnoremap : ;
nnoremap ; :

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

nnoremap gs :Gstatus <CR> G
