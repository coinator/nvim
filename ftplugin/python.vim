setlocal foldmethod=indent foldnestmax=2

vnoremap // :norm ^i # <CR>

augroup Format
  autocmd! 
  autocmd! BufWritePost *.py silent! Black
augroup END

"let g:neoterm_repl_python = 'python3.8 -m jupyter_console'
let g:neoterm_repl_python = 'jupyter-console'
" correctly paste indents
augroup PythonREPL
  autocmd!
  autocmd BufEnter *.py let g:neoterm_bracketed_paste = 1
  autocmd BufLeave *.py let g:neoterm_bracketed_paste = 0
augroup end

augroup NeotermPython
  autocmd!
  autocmd FileType python nnoremap <silent><buffer> <leader>ca :call RunPython()<CR>
  autocmd FileType python nnoremap <silent><buffer> <leader>cl :T exit<CR> <bar> <CMD>Tclose!<CR>
  autocmd FileType python nnoremap <silent> <leader><leader> :call RunMainPython()<CR>
augroup end

function! RunPython()
  let filename = expand('%')
  if filename[0:4] ==# 'test'
    execute 'T pytest ' . filename
  else
    call neoterm#repl#python#exec(["%run " . filename])
  endif
endfunction

function! RunMainPython()
  call neoterm#repl#python#exec(["%run " . g:main_file])
endfunction
