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

nnoremap <Plug>FzfFiles :Files<CR>
nmap <C-p> <Plug>FzfFiles

nnoremap <Plug>FzfBuffers :Buffers<CR>
nmap <leader>ls <Plug>FzfBuffers

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

augroup nonEmptyNonWiki
	autocmd!
	autocmd BufRead,BufNewFile **/vimwiki/*.wiki let b:wiki=1
	autocmd BufRead,BufNewFile * call EnableVimwikiNewWindow()
	function! EnableVimwikiNewWindow()
		if !exists("b:wiki")
			let b:indexWiki = bufexists('vimwiki/index.wiki')
			if !b:indexWiki
				nnoremap <buffer> defaultVimwikiWindow :silent !gnome-terminal -- nvim -c 'VimwikiIndex'<CR>
				nmap <silent> <leader>ww defaultVimwikiWindow
			endif
		endif
	endfunction
augroup end

"FZF Buffer Delete
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:deletebuffers(lines)
  echo a:lines
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! Bdelete call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:deletebuffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

nnoremap <leader>bd :Bdelete<CR>
command! -bar -bang -nargs=? -complete=buffer Buffers  call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({ "placeholder": "{0}" }), <bang>0)

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
