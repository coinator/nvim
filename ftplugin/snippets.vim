augroup RemoveSnippetBuffer
  autocmd!
  autocmd BufLeave *.snippets  bw
augroup END
