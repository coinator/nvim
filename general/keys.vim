" my lazy remaps
noremap : ;
noremap ; :
noremap q; q:

" add lines
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-^> <Esc><C-w>^
" avoid inoremap <C-k>, in order to add umlauts

autocmd termOpen * nnoremap <buffer> <Up> a<Up>
tnoremap gt <C-\><C-N>gt
tnoremap <C-^> <C-\><C-N><C-^>

nnoremap <leader>n :noh<CR>

nnoremap gs :Gstatus <CR> G

nnoremap <Plug>FzfFiles :Files<CR>
nmap <C-p> <Plug>FzfFiles

nnoremap <Plug>FzfBuffers :Buffers<CR>
nmap <leader>ls <Plug>FzfBuffers

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" open vimwiki in new terminal
nnoremap VimwikiWindow :silent !gnome-terminal -- nvim -c 'VimwikiIndex'<CR>
nmap <silent> <leader>ww VimwikiWindow

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
