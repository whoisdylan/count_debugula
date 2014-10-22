if exists("g:loaded_count_debugula") || &cp
	finish
endif
let loaded_count_debugula = 100
let s:count = 1
let s:keepcpo = &cpo
set cpo&vim

if !hasmapto('<Plug>CountDebugulize')
	map <unique> <Leader>d <Plug>CountDebugulize
endif

map <silent> <unique> <script> <Plug>CountDebugulize
	\ :set lz<CR>:call <SID>CountDebugulize()<CR>:set nolz<CR>

fun! s:CountDebugulize()
	execute "normal! Oprintf(\"CountDebugula " . s:count . "\\n\");\<esc>"
	let s:count += 1
endfun

let &cpo = s:keepcpo
unlet s:keepcpo
