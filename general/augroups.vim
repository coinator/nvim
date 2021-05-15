function! AdjustHistFile()
	let env = $TERM_PROGRAM
	let histfile = $HISTFILE
	if env == "tmux" && histfile != ""
		if  split(histfile, "/")[-1] != ".zsh_history"
			let fcCommand = "fc -p " . histfile  .  "\n"
			call jobsend(b:terminal_job_id, fcCommand)
			call jobsend(b:terminal_job_id, "clear \n")
			echom "Correct history file chosen"
		endif
	endif
endfunction

augroup term
	autocmd!
	autocmd TermOpen * setlocal nonumber norelativenumber
	" autocmd TermOpen * call AdjustHistFile()
augroup end
