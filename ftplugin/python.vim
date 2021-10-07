setlocal foldmethod=indent foldnestmax=2

vnoremap // :norm ^i # <CR>

augroup Format
  autocmd! 
  autocmd! BufWritePost *.py silent! Black
augroup END
