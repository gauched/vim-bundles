" --- .vimrc ---


" --- Global settings independent of plugins or OS.

" Pathogen load

set fileformats=dos,unix " Some bundles are saved with windows line endings.

" Setup autoload/pathogen.vim
if has("mac") || has("macunix")
  set runtimepath=~/.vim,$VIMRUNTIME
endif

if has("win32")
  set runtimepath=w:/.vim,$VIMRUNTIME,w:/.vim/bundle/snipmate.vim/after
endif


runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


" Vundle Setup

"set nocompatible               " be iMproved
"filetype off                   " required!

"set rtp+=w:/.vim/bundle/vundle/
"call vundle#rc()

"" let Vundle manage Vundle
"" required!
"Bundle 'gmarik/vundle'

"" My Bundles here:
""
"" original repos on github
""Bundle 'tpope/vim-fugitive'
""Bundle 'Lokaltog/vim-easymotion'
""Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
""Bundle 'tpope/vim-rails.git'
"" vim-scripts repos
""Bundle 'L9'
""Bundle 'FuzzyFinder'
"" non github repos
""Bundle 'git://git.wincent.com/command-t.git'
""
"Bundle ''


"filetype plugin indent on     " required!


" Color Scheme

if has('gui_running')
  set background=light
  colorscheme solarized
else
  if has("mac") || has("macunix")
    let g:solarized_termcolors=256
    set background=light
    colorscheme solarized
  endif

  if has("win32")
    let g:solarized_termcolors=16
    colorscheme elflord
  endif
endif


" --- Abbreviations (imaps plugin)

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
map <LocalLeader>trim :call Trimy()<CR>

map + zo
map = zc
map ; :
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
inoremap <C-,> <C-X>
map gs ]s
map gS [s
noremap <F7> <ESC>:set spell!<CR>
noremap! <F7> <ESC>:set spell!<CR>
vmap  d
nmap S :%s!
vmap S :%s!


" --- File browsing

noremap <C-S> <ESC>:w<CR>
inoremap <C-S> <ESC>:w<CR>


" --- File types

filetype on
filetype plugin on
syntax enable
syntax on


  " Markdown

  map <LocalLeader>mid Yp:.s! !!g<CR>:.s!#*!{: #!<CR>:.s!$!}!<CR><ESC>


  " Ruby

  let ruby_fold=2
  au BufRead,BufNewFile *.rb set tags=.tags

  map <LocalLeader>,) :s!)\\|(! !g<CR>

  map <LocalLeader>rg :vimgrep /Bug:\\|Note:\\|Todo:/j ./* bin/** config/** features/** lib/** spec/** \| copen

  " Wrap current word in #{}
  map <LocalLeader>," ebi#{<ESC>ea}

  function! LogFix()
    silent! %s!\([Ll]og\.\w*\)(\(.*\))!\1 \2
    silent! %s/\([Ll]og\.\w* .*\)\$!\.to_s/\1 #{$!}
  endfunction


  " Others

  au BufNewFile,BufRead *.ahk setf ahk
  au BufNewFile,BufRead *.log setf log
  au BufNewFile,BufRead *.vb setf vb
  au BufRead,BufNewFile *.vm  setf velocity

  map <LocalLeader>fh :set ft=html<CR>
  map <LocalLeader>fj :set ft=javascript<CR>
  map <LocalLeader>fm :set ft=markdown<CR>
  map <LocalLeader>fr :set ft=ruby<CR>
  map <LocalLeader>fs :set ft=sql<CR>
  map <LocalLeader>fv :set ft=vb.net<CR>


set autochdir
set autoread
set backspace=2
set cryptmethod=blowfish
set cmdheight=2
set confirm
set cpoptions+=J
set cursorline
"set encoding=utf-8
set equalalways
set foldnestmax=2
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set iskeyword+=;
set laststatus=2
set linebreak
set nocompatible
set nowrapscan
set scrolloff=6
set sessionoptions=buffers,curdir,folds,tabpages,winsize
set showbreak=…
set hl=@:Text
set showcmd
set showmatch
set showmode
set statusline=%<%f%h%m%r%=\ \ \ \ %-30{tagbar#currenttag('\|%s\|','')}\ \ \ \ ft=%Y\ \ \ ff=%{&ff}\ \ \ %5l:%2c\ "there's a space before this comment.
set timeoutlen=1500
set wildchar=<Tab>
set wildmenu
set whichwrap=b,h,l,<,>,[,]
set viminfo+=!


" ============ Indentation ============

set autoindent
set expandtab
set shiftwidth=2
set shiftround
set smartindent
set smarttab
set softtabstop=2
set tabstop=8


" Change the status bar color based on the mode.
set laststatus=2
if version >= 700
  au InsertEnter * hi StatusLine term=reverse guibg=lightgreen
  au InsertEnter * hi Cursor guibg=green
  au InsertLeave * hi StatusLine term=reverse guibg=orange
  au InsertLeave * hi Cursor guibg=orange
endif


" GUI Specific

if has("gui_running")
  set guioptions+=c
  set guioptions-=L
  set guioptions-=T

  set guitablabel=%t

  set splitright
endif


" --- Plugin specific

  let g:DrChipTopLvlMenu= "Plugin."


  " --- Align
  map <Leader>ah :Align "=>"<CR>


  " --- acp AutoComplPop
  let g:acp_enableAtStartup = 0
  let g:acp_behaviorSnipmateLength = 1


  " --- Lusty File Explorer
  map <silent> <LocalLeader>lf :LustyFilesystemExplorer<CR>
  map <silent> <LocalLeader>lr :LustyFilesystemExplorerFromHere<CR>
  noremap <LocalLeader>tt <ESC>:tabedit<CR>:LustyFilesystemExplorer<CR>
  noremap <LocalLeader>nn <ESC>:tabnew<CR>
  set wildignore=*_svn,*.dll,*.exe,*.msi,*.zip,*.com,*.gif,*.ico,*.jpg,*.png,*.xpm


  " --- Lusty Juggler
  map <LocalLeader>lg :LustyJuggler<CR>


  " --- NERD Commenter
  let g:NERDShutUp = 1


  " --- NERD Tree
  let g:NERDTreeShowBookmarks = 1
  let g:NERDTreeMapOpenInTab = 0
  map <LocalLeader>ntt :NERDTreeToggle<CR>


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


  " --- Syntastic
  let g:syntastic_check_on_open=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_loc_list_height=3


  " --- Tagbar
  "let g:tagbar_autofocus = 1
  let g:tagbar_autoshowtag = 1
  let g:tagbar_sort = 0
  let g:tagbar_width = 30
  imap <silent> <F9> <C-[>:TagbarToggle<CR>
  nmap <silent> <F9> :TagbarToggle<CR>

  " Todo: Add CoffeeScript support.

  let g:tagbar_type_markdown = {
          \ 'ctagstype' : 'markdown',
          \ 'kinds' : [
                  \ 'h:Heading_L1',
                  \ 'i:Heading_L2',
                  \ 'k:Heading_L3'
          \ ]
  \ }

  " Open Tagbar with supported files
  autocmd VimEnter * nested :call tagbar#autoopen(1)


  " --- Taglist
  "let Tlist_GainFocus_On_ToggleOpen = 1
  let Tlist_WinWidth = 40
  imap <silent> <F8> <C-[>:TlistToggle<CR>
  nmap <silent> <F8> :TlistToggle<CR>
  nmap <C-F8> :TlistAddFilesRecursive


  " --- vim-rails
  let g:rails_ctags_arguments='--languages=-javascript --exclude=vendor'


  " --- vim-rake
  let g:rake_ctags_arguments='--languages=-javascript --exclude=vendor'

  " --- YankRing
  imap <silent> <F11> <C-[>:YRShow<CR>
  nnoremap <silent> <F11> :YRShow<CR>


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

    set dir=/tmp
    "set shell=bash

    map <LocalLeader>HT :%!tidy -f /tmp/tidy.txt -config ~/.tidy<CR>:vsplit /tmp/tidy.txt<CR>:q


    if has("gui_running")
      set antialias

      set columns=100
      set lines=65
    endif
  endif


  " --- Windows Mappings and Settings.
  if has("win32")

    " Backspace in Visual mode deletes selection
    vnoremap <BS> d

    " CTRL-X are Cut
    vnoremap <C-X> "+x

    " CTRL-C are Copy
    vnoremap <C-C> "+y

    " CTRL-V are Paste
    map <C-V>        "+gP
    noremap! <C-V>    <ESC>"+gPa
    cmap <C-V>        <C-R>+

    " CTRL-A is Select All
    noremap <C-A> gggH<C-O>G
    inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
    cnoremap <C-A> <C-C>gggH<C-O>G

    " CTRL-Tab is Next window
    noremap <C-Tab> <C-W>w
    inoremap <C-Tab> <C-O><C-W>w
    cnoremap <C-Tab> <C-C><C-W>w

    set dir=$TMP

    au BufRead,BufNewFile *.rb set tags=tags,c:/Users/chart/Work/Code/ruby/tags

    fun! Tidy()
      exe "silent %!tidy -f " . $TMP . "\\tidy.txt -config h:/.tidy"
      exe "silent vsplit $TMP/tidy.txt"
    endfun
    map <LocalLeader>HT :call Tidy()<CR>
    map <LocalLeader>HX :%!tidy -i -q -xml -w 80<CR>:%s/^  <\(\w\)/\r  <\1/e<CR>:%s/^  <!/\r  <!/e<CR>:nohl<CR>
    map <LocalLeader>HC :%!csstidy - --sort_properties=true<CR>

    if has("gui_running")
      set columns=109
      set lines=66

      set guifont=Consolas:h9
    endif

    " --- NERDTree
    map <LocalLeader>ntw :NERDTree c:/Users/chart/Work<CR>

  endif
