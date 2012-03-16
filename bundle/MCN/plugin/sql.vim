function! FormatTraceCursor()
ruby << EOF

	VIM.command('%s!\_.\{-}N\'Select!Select!')
	VIM.command('%s!select @.*!!')
	VIM.command('%s!OPTION (FAST\_.*@P.\{-},!Parameters: !')
	VIM.command('%s!\(Parameters: .*\)\n!\1!')

	buffer = VIM::Buffer.current

	# Note: Sometimes the Parameters span more than one line.
	for i in 1..buffer.length
		if buffer[i] =~ /Parameters: /
			parameters = buffer[i].sub(/Parameters: /, '').split(', ')
			buffer[i] = ''	# Delete the line.
		end
	end

	VIM.command('%SQLUFormatter')

	for i in 1..buffer.length
		loop do
			if buffer[i] =~ /@P\d+/
				buffer[i] = buffer[i].sub(/@P\d+/, parameters.shift)
			else
				break
			end
		end
	end

	VIM.command('%s!\'\' \'\'!\'\' + \'\'!')
	VIM.command('set ft=sql')

	buffer.append(buffer.length, 'OPTION(FAST 40)')

EOF
endfunction

map <Leader>cf :call FormatTraceCursor()<CR>


function! CloseComplete()
ruby << EOF
	b = VIM::Buffer.current
	for i in 1..b.count
		VIM.command(i.to_s + 'foldc') if b[i] =~ /^\s*Complete/
	end
EOF
endfunction
