set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up Vundle (realpython.com/vim-and-python-a-match-made-in-heaven)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/VundleVim/Vundle.vim
set nocompatible             " required
filetype off                 " required

set rtp+=~/.vim/bundle/Vundle.vim  " Set runtime path
call vundle#begin()          " required

" START list plugins
Plugin 'VundleVim/Vundle.vim'  " Manages itself
Plugin 'tmhedberg/SimpylFold'  " Better folding
Plugin 'vim-scripts/indentpython.vim'  " Auto indent for Python
Plugin 'Vimjas/vim-python-pep8-indent'  " Tweaks for multi line indents
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-syntastic/syntastic'  " Syntax checks
Plugin 'nvie/vim-flake8'          " Pep8 checks
Plugin 'mrk21/yaml-vim'
Plugin 'PeterRincker/vim-searchlight'  " Colors the current search res differently
" END list plugins

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" Plugin options
let g:SimpylFold_fold_import = 0
let g:SimpylFold_fold_docstring = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Visual Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
" colorscheme smyck
" From: https://github.com/arcticicestudio/nord-vim
" $ mkdir -p ~/.vim/colors
" $ git clone https://github.com/arcticicestudio/nord-vim.git ~/.vim/nord-vim
" $ cp ~/.vim/nord-vim/colors/nord.vim ~/.vim/colors/
" $ rm -r ~/.vim/nord-vim
colorscheme nord

" 256 colors for solarized
" let g:solarized_termcolors=256

" Color every column gretaer than 80
highlight ColorColumn ctermbg=Black
let &colorcolumn=join(range(81,999),",")

" Linenumbers
set number

let python_highlight_all=1
syntax on
set ruler

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key-Remap Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Set indent/unindent in all modes to tab/shift-tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Cycle completion menu on tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Move line up/down (alt-k, alt-j) and duplicate line (alt-shift-d)
" Note: Keyboard dependent and probably OSX only
" nnoremap ∆ ddkP
" nnoremap ˚ ddp
" nnoremap Î yyp

" Disable arrow keys
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>
" inoremap <Right> <NOP>
" inoremap <Left> <NOP>
" nnoremap <Up> <NOP>
" nnoremap <Down> <NOP>
" nnoremap <Right> <NOP>
" nnoremap <Left> <NOP>

" Code folding to space bar
" set foldmethod=indent
" set foldlevel=99
nnoremap <space> za

" Search for visual mode seleected text using //
" https://vim.fandom.com/wiki/Search_for_visually_selected_text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Other Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab indentation settings: Tabs with 4 cols; Show invisible characters
" This needs a supporting font, uncomment if not available
" set list listchars=tab:▸\ ,trail:∙,eol:¬
" This is the ASCII version
set listchars=tab:\ \ \|,space:.,extends:>,precedes:<,nbsp:~,eol:$
set list
highlight NonText ctermfg=DarkGrey
highlight SpecialKey ctermfg=DarkGrey
set tabstop=4
set shiftwidth=4
set noexpandtab

" Set no word wrap
set nowrap

" Filename completion
set wildmenu
set wildmode=longest,list

" Centralize backups, swapfiles and undo history in temp folder
set viminfo+=n/work/thorben.menne/.vim/viminfo
set backupdir=/work/thorben.menne/.vim//
set directory=/work/thorben.menne/.vim//
set undodir=/work/thorben.menne/.vim//

" No error bells
set noerrorbells

set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Custom Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Strip trailing whitespace (call with \ss)
function! StripWhitespace()
        let save_cursor = getpos(".")
        let old_query = getreg('/')
        :%s/\s\+$//e
        call setpos('.', save_cursor)
        call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

