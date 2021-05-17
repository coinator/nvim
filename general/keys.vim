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

autocmd termOpen * nnoremap <buffer> <C-P> a<Up>
tnoremap gt <C-\><C-N>gt
tnoremap <C-^> <C-\><C-N><C-^>

nnoremap <leader>n :noh<CR>

nnoremap gs :Gstatus <CR> G

nnoremap <silent> <C-p> :lua require('telescope.builtin').find_files{ find_command = { 'ag',  '--hidden',  '--ignore=venv', '--ignore=.git', '-g', ''} }<CR>
nnoremap <leader>tt <CMD>Telescope live_grep<CR>
nnoremap <leader>ls <CMD>Telescope buffers<CR>

nnoremap <silent> <leader><leader> :WhichKey '<Space>'<CR>

nnoremap <leader>cc :TREPLSendLine<CR>
nnoremap <leader>ca :TREPLSendFile<CR>
vnoremap <leader>cc :TREPLSendSelection<CR>

nnoremap <leader>g <CMD>ZenMode<CR>

nnoremap <silent> <leader>d :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>s  :lua require'dap'.step_over()<CR>
nnoremap <silent> <leader>si  :lua require'dap'.step_into()<CR>
nnoremap <silent> <leader>so  :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>ro :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>rl :lua require'dap'.run_last()<CR>
