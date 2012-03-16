function! VBString()
	silent! exe '%s!\s\+$!!e'
	silent! exe '%s!\n\n*\%$!!e'
	silent! exe '%s!\t!   !ge'
	silent! exe '%s!^!"\t!e'
ruby << EOF
	b = VIM::Buffer.current
	maxlength = 0
	for i in 1..b.count
		if b[i].length > maxlength
			maxlength = b[i].length
		end
	end
	for i in 1..b.count
		b[i] = b[i] + (" " * (maxlength - b[i].length))
	end
EOF
	silent! exe '%s!$!\t" \& _!'
endfunction

map <LocalLeader>vs :call VBString()<CR>


function! VBUnString()
	silent! exe '%s!^\s*&*\s*"!!'
	silent! exe '%s!"\s*_\?\s*$!!'
	silent! exe '%s!"\s*&\s*_\?\s*$!!'
endfunction

map <LocalLeader>vu :call VBUnString()<CR>
