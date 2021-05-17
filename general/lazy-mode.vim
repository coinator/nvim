function! EnterLazyMode()
  echo "Welcome to Lazy Land!"
  nnoremap j <C-D>
  nnoremap k <C-U>
  nnoremap <leader>j <CMD>ExitLazyMode<CR>
  nnoremap <leader>k <CMD>ExitLazyMode<CR>
endfunction

function! ExitLazyMode()
  echo "Bye-Bye Lazy Land!"
  unmap j
  unmap k
  nnoremap <leader>j <CMD>EnterLazyMode<CR>
  nnoremap <leader>k <CMD>EnterLazyMode<CR>
endfunction

command EnterLazyMode :call EnterLazyMode()
command ExitLazyMode :call ExitLazyMode()
nnoremap <leader>j <CMD>EnterLazyMode<CR>
nnoremap <leader>k <CMD>EnterLazyMode<CR>
