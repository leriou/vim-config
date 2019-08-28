" Use the desert theme
set background=dark
colorscheme desert

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Make tabs as wide as four spaces
set tabstop=4
" Show “invisible” characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Set how many lines of history Vim has remember
set history=1000
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Kept the cursor on the same column.
set nostartofline


" Trim extra whitespace
function! StripTrailingWhitespace()
	let save_cursor = getpos(".")
	let save_search = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', save_search)
endfunction

" Toggle “invisible” characters
function! ToggleInvisibles()
	set nolist!
endfunction

" Change mapleader
let mapleader=","

" Strip trailing whitespace (,ss)
noremap <leader>ss :call StripTrailingWhitespace()<cr>
" Toggle “invisible” characters (,v)
noremap <leader>v :call ToggleInvisibles()<cr>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<cr>

" Smart way to move between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l


" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif


" Load local settings if they exist.
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif
