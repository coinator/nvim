noremap : ;
noremap ; :

" add lines
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" in order to use tmux better
"noremap <C-A> <nop>
"noremap <leader><C-A> <C-A>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-h> <Esc><C-w>h
inoremap <C-j> <Esc><C-w>j
inoremap <C-k> <Esc><C-w>k
inoremap <C-l> <Esc><C-w>l
inoremap <C-^> <Esc><C-w>^

autocmd termOpen * nnoremap <buffer> <Up> a<Up>
tnoremap gt <C-\><C-N>gt

nnoremap <leader>n :noh<CR>

nnoremap gs :Gstatus <CR> G

nnoremap <Plug>FzfFiles :Files<CR>
nmap <C-p> <Plug>FzfFiles

nnoremap <Plug>FzfBuffers :Buffers<CR>
nmap <leader>ls <Plug>FzfBuffers

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
 
" Vimspector
nmap <F5>         <Plug>VimspectorContinue
nmap <F3>         <Plug>VimspectorStop
nmap <F4>         <Plug>VimspectorRestart
nmap <F6>         <Plug>VimspectorPause
nmap <F9>         <Plug>VimspectorToggleBreakpoint
nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap <F8>         <Plug>VimspectorAddFunctionBreakpoint
nmap <F10>        <Plug>VimspectorStepOver
nmap <leader>vi   <Plug>VimspectorStepInto
nmap <leader>vo   <Plug>VimspectorStepOut
