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
	let filetype = &filetype
	if filetype == "c"
		execute "normal! Oprintf(\"CountDebugula " . s:count . "\\n\");\<esc>"
	elseif filetype == "cpp"
		execute "normal! Ostd::cout << \"CountDebugula " . s:count . "\" << std::endl;\<esc>"
	elseif filetype == "ruby" || filetype == "eruby"
		execute "normal! Oprint \"CountDebugula " . s:count . "\\n\"\<esc>"
	elseif filetype == "javascript"
		execute "normal! Oconsole.log(\"CountDebugula " . s:count . "\");\<esc>"
        elseif filetype == "scala"
                execute "normal! Oprintln(\"CountDebugula " . s:count . "\")\<esc>"
        elseif filetype == "click"
		execute "normal! Oprint \"CountDebugula " . s:count . "\",\<esc>"
	endif
	let s:count += 1
endfun

let &cpo = s:keepcpo
unlet s:keepcpo
