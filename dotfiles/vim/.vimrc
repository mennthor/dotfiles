" Taken and modified from:
" http://timreynolds.org/2013/05/26/configuring-vim-on-mac-os-x/
" Pathogen package runtime installer
execute pathogen#infect()
filetype plugin indent on

" jedi autocomplete
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview

" Make Vim more useful
set nocompatible
" Set color scheme
colorscheme smyck
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don't add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history in temp folder
set backupdir=/private/tmp
set directory=/private/tmp
if exists("&undodir")
        set undodir=/private/tmp
endif

set viminfo+=! " make sure vim history works
map <C-J> <C-W>j<C-W>_ " open and maximize the split below
map <C-K> <C-W>k<C-W>_ " open and maximize the split above
set wmh=0 " reduces splits to a single line

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Always show status line
set laststatus=2
" Make tabs as wide as four spaces
set tabstop=4
" Enable line numbers
set number
" Show 'invisible' characters (trailing spaces=·, tabs= », EOL=¶)
set list!
set lcs=tab:»\ ,trail:·" ,eol:¶
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Respect modeline in files
set modeline
set modelines=4
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don't reset cursor to start of line when moving around
set nostartofline
" Show the cursor position
set ruler
" Don't show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it's being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
" noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
        " Enable file type detection
        filetype on
        " Treat .json files as .js
        autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif
