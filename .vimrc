" --- .vimrc ---


" --- Windows Mappings and Settings.
if has("win32")
	set runtimepath=w:/.vim,$VIMRUNTIME
endif


" --- Global settings independent of plugins or OS.

" Pathogen load
call pathogen#infect()
syntax on

set background=light
colorscheme solarized


" --- Abbreviations (imaps plugin)

iab wuh (I don't know what this means. -cjh)
imap <A--> –


" --- Dvorak keys

map t l
map T L
map <C-W>t <C-W>l
map! <C-W>t <C-W>l
map <C-W>T <C-W>L
map! <C-W>T <C-W>L


" --- General keys

let maplocalleader=','

noremap <ESC> :nohl<CR> <ESC>

fun! Trimy()
	exe '%s!\s\+$!!e'
	exe '%s!\n\n*\%$!!e'
	exe "nohl"
endfun

map <LocalLeader>" :s!"!'!g<CR>
map <LocalLeader>' :s!'!"!g<CR>
map <LocalLeader>) :s!)\\|(! !g<CR>

map <LocalLeader>te :tabedit<CR>

map <LocalLeader>trim :call Trimy()<CR>
"map <LocalLeader>ind :/^\s* /<CR>
map + zo
map = zc
map ; :
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
map gs ]s
map gS [s
noremap <F7> <ESC>:set spell!<CR>
noremap! <F7> <ESC>:set spell!<CR>
vmap  d
nmap S :%s!
vmap S :s!


" --- File browsing

noremap <C-S> <ESC>:w<CR>
inoremap <C-S> <ESC>:w<CR>


" --- File types

filetype on
filetype plugin on
au BufNewFile,BufRead *.ahk setf ahk
au BufNewFile,BufRead *.log setf log
au BufRead,BufNewFile *.rb set tags=.tags,c:/Users/chart/Code/ruby/.tags
au BufNewFile,BufRead *.vb setf vb
au BufRead,BufNewFile *.vm  setf velocity

let ruby_fold=2
map <LocalLeader>fh :set ft=html<CR>
map <LocalLeader>fj :set ft=javascript<CR>
map <LocalLeader>fo :set ft=vo_base<CR>
map <LocalLeader>fr :set ft=ruby<CR>
map <LocalLeader>fs :set ft=sql<CR>
map <LocalLeader>fv :set ft=vb.net<CR>
syntax enable

set autochdir
set autoindent
set autoread
set backspace=2
set cryptmethod=blowfish
set cmdheight=2
"set colorcolumn=+1
set confirm
set cpoptions+=J
set cursorline
"set encoding=utf-8
set equalalways
set fileformats=dos,unix
set foldnestmax=2
set hidden
set hlsearch
set ignorecase
set incsearch
set iskeyword+=;
set laststatus=2
set linebreak
set nocompatible
set nowrapscan
"set shell=bash
set sessionoptions=buffers,curdir,folds,tabpages,winsize
set shiftwidth=3
set shiftround
set showbreak=…
set hl=@:Text
set showcmd
set showmatch
set showmode
set smartindent
set smarttab
set softtabstop=3
set statusline=%<%f%h%m%r%=\ \ \ \ \ \ \ \ \ \ %y\ \ \ (%{&ff})\ \ \ %l:%c\ "there's a space before this comment.
set tabstop=3
set timeoutlen=1500
set wildchar=<Tab>
set wildmenu
set whichwrap=b,h,l,<,>,[,]
set viminfo+=!


" Change the status bar color based on the mode.
set laststatus=2
if version >= 700
	au InsertEnter * hi StatusLine term=reverse guibg=lightgreen
	au InsertEnter * hi Cursor guibg=green
	au InsertLeave * hi StatusLine term=reverse guibg=orange
	au InsertLeave * hi Cursor guibg=orange
endif


" --- Plugin specific

	let g:DrChipTopLvlMenu= "Plugin."


	" --- Align
	map <Leader>ah :Align "=>"<CR>


	" --- acp AutoComplPop
	let g:acp_enableAtStartup = 0
	let g:acp_behaviorSnipmateLength = 1


	" --- IndentConsistencyCop
	noremap <F3> <ESC>:IndentConsistencyCop<CR>
	noremap! <F3> <ESC>:IndentConsistencyCop<CR>


	" --- Lusty File Explorer
	map <silent> <LocalLeader>lf :LustyFilesystemExplorer<CR>
	map <silent> <LocalLeader>lr :LustyFilesystemExplorerFromHere<CR>
	noremap <LocalLeader>tt <ESC>:tabedit<CR>:LustyFilesystemExplorer<CR>
	noremap <LocalLeader>nn <ESC>:tabnew<CR>
	set wildignore=*_svn,*.dll,*.exe,*.msi,*.zip,*.com,*.gif,*.ico,*.jpg,*.png,*.xpm


	" --- Lusty Juggler
	map <LocalLeader>lg :LustyJuggler<CR>


	" --- Nerd Commenter
	let g:NERDShutUp = 1


	" --- Nerd Tree
	let g:NERDTreeShowBookmarks = 1
	let g:NERDTreeMapOpenInTab = 0
	map <LocalLeader>ntc :NERDTreeClose<CR>
	map <LocalLeader>nto :NERDTree<CR>
	map <LocalLeader>ntw :NERDTree c:/Users/chart/Work<CR>


	" --- Ruby
	function! LogFix()
		silent! %s!\([Ll]og\.\w*\)(\(.*\))!\1 \2
		silent! %s/\([Ll]og\.\w* .*\)\$!\.to_s/\1 #{$!}
	endfunction


   " --- Session
   let g:session_autoload = 'yes'
   let g:session_autosave = 'no'

	" --- Session Manager
	map <LocalLeader>ls :SessionList<CR>


	" --- snipMate
	let g:snips_author = 'Colby Hart'
		function! Unfold()
			set foldlevel=100
			return ''
		endfunction


	" --- SqlFormatter
	let g:sqlutil_align_comma = 1
	let g:sqlutil_keyword_case = '\L'
	map <LocalLeader>sf :SQLUFormatter<CR>
	let g:xml_syntax_folding = 1



" --- Operation System Specific


	" --- Mac Mappings and Settings.
	if has("mac") || has("macunix")
		map <D-n> <C-n>
		map! <D-n> <C-n>
		map <D-o> <C-O>
		map! <D-o> <C-O>
		map <D-s> <C-s>
		map! <D-s> <C-s>
		map <D-t> <C-t>
		map! <D-t> <C-t>
		map <LocalLeader>HT :%!tidy -f /tmp/tidy.txt -config ~/.tidy<CR>:vsplit /tmp/tidy.txt<CR>:q
		set dir=/tmp
		let g:GetLatestVimScripts_wget='/opt/local/bin/wget'
		if has("gui_running")
			set antialias
			set columns=100
			set lines=65
			set guioptions+=c
			set splitright
		endif
	endif


	" --- Windows Mappings and Settings.
	if has("win32")

		"let g:GetLatestVimScripts_wget='c:/bin/curl.exe'
		"let g:GetLatestVimScripts_options = '-U : --proxy-ntlm --proxy 192.168.0.200:8088 -o'

	fun! Tidy()
		exe "silent %!tidy -f " . $TMP . "\\tidy.txt -config h:/.tidy"
		exe "silent vsplit $TMP/tidy.txt"
	endfun

		map <LocalLeader>HT :call Tidy()<CR>
		map <LocalLeader>HC :%!csstidy - --sort_properties=true<CR>
		map <LocalLeader>HX :%!tidy -i -q -xml -w 80<CR>:%s/^  <\(\w\)/\r  <\1/e<CR>:%s/^  <!/\r  <!/e<CR>:nohl<CR>

	fun! RubyCheck()
		exe "silent !ruby -c % > " . $TMP . "\\rubycheck.txt"
		exe "silent split $TMP/rubycheck.txt"
	endfun
		map <LocalLeader>RC :call RubyCheck()<CR>

		set dir=$TMP
		set splitbelow

		if has("gui_running")
			map <LocalLeader>bw :set columns=180<CR>:set lines=66<CR>
			map <LocalLeader>sw :set columns=90<CR>:set lines=40<CR>

			set columns=96
			set lines=66
			set guifont=Consolas:h9
			set guioptions+=c
			set guioptions-=T
			set guioptions-=L
			set guitablabel=%t
		endif

		" Backspace in Visual mode deletes selection
		vnoremap <BS> d

		" CTRL-X and SHIFT-Del are Cut
		vnoremap <C-X> "+x
		vnoremap <S-Del> "+x
		"map! <C-X> <ESC>"+xa

		" CTRL-C and CTRL-Insert are Copy
		vnoremap <C-C> "+y
		vnoremap <C-Insert> "+y
		noremap! <C-Insert> <ESC>"+ya

		" CTRL-V and SHIFT-Insert are Paste
		map <C-V>        "+gP
		map <S-Insert>        "+gP
		noremap! <C-V>    <ESC>"+gPa

		cmap <C-V>        <C-R>+
		cmap <S-Insert>        <C-R>+

		noremap <C-A> gggH<C-O>G
		inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
		cnoremap <C-A> <C-C>gggH<C-O>G

		" CTRL-Tab is Next window
		noremap <C-Tab> <C-W>w
		inoremap <C-Tab> <C-O><C-W>w
		cnoremap <C-Tab> <C-C><C-W>w

	endif
