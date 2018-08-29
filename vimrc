"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
execute pathogen#infect()
execute pathogen#helptags()
set nocompatible
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Enable autocompletion:
set wildmode=longest,list,full

" Turn on the WiLd menu
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Line
set number
set relativenumber

" Cursorline
set list
set cursorline
"hi CursorLine   cterm=NONE ctermbg=gray ctermfg=NONE guibg=cyan guifg=black
"hi CursorColumn cterm=NONE ctermbg=gray ctermfg=NONE guibg=cyan guifg=black
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme atomified

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Make notes markdown compatibles:
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost */calcurse-note.* set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Shortcuts for languages
map <leader>se :setlocal spell spelllang=en_us<cr>
map <leader>su :setlocal spell spelllang=uk_ua<cr>
map <leader>sr :setlocal spell spelllang=ru_ru<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Vim session manager
"let g:sessions_dir = '~/.vim/sessions'
"exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
"exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" Format JSON in vim using Python’s json.tool module
" ,jt
map <leader>jt  <Esc>:%!python -m json.tool<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""LATEX
" Word count:
autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
" Compile document using xelatex:
autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
" Code snippets
autocmd FileType tex inoremap ;fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ;fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap ; <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ;cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ;glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ;x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ;ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ;can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ;a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ;sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ;tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ;bt {\blindtext}
autocmd FileType tex inoremap ;nu $\varnothing$
autocmd FileType tex inoremap ;col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ;rn (\ref{})<++><Esc>F}i

"""LATEX Logical symbols
autocmd FileType tex inoremap ;m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;M $$$$<Enter><Enter><++><Esc>2k$hi
autocmd FileType tex inoremap ;neg {\neg}
autocmd FileType tex inoremap ;V {\vee}
autocmd FileType tex inoremap ;or {\vee}
autocmd FileType tex inoremap ;L {\wedge}
autocmd FileType tex inoremap ;and {\wedge}
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;ex {\exists}
autocmd FileType tex inoremap ;dia	{\Diamond}
autocmd FileType tex inoremap ;box	{\Box}
autocmd FileType tex inoremap ;gt	{\textgreater}
autocmd FileType tex inoremap ;lt	{\textless}
"""LaTeX Linguistics Shortcuts
autocmd Filetype tex inoremap ;nom {\textsc{nom}}
autocmd FileType tex inoremap ;acc {\textsc{acc}}
autocmd FileType tex inoremap ;dat {\textsc{dat}}
autocmd FileType tex inoremap ;gen {\textsc{gen}}
autocmd FileType tex inoremap ;abl {\textsc{abl}}
autocmd FileType tex inoremap ;voc {\textsc{voc}}
autocmd FileType tex inoremap ;loc {\textsc{loc}}
autocmd Filetype tex inoremap ;inst {\textsc{inst}}
autocmd FileType tex inoremap ;tipa \textipa{}<Space><++><Esc>T{i

