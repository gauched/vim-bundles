function! FormatFeatures()
" Indent behaviour driven development feature files.
	silent! exe '%s!^\s*Scenario:!  Scenario:!'
	silent! exe '%s!^\s*Given!      Given!'
	silent! exe '%s!^\s*When!       When!'
	silent! exe '%s!^\s*Then!       Then!'
	silent! exe '%s!^\s*And!        And!'
	silent! exe '%s!^\s*But!        But!'
endfunction
