setlocal textwidth=120

setlocal shiftwidth=2
setlocal formatoptions-=o


augroup LuaFiles
  autocmd!
  autocmd BufWritePost  *.lua :silent !stylua <afile>
augroup END
