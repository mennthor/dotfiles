""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Visual Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
" colorscheme smyck

" 256 colors for solarized
" let g:solarized_termcolors=256

" Color every column gretaer than 80
highlight ColorColumn ctermbg=Black
let &colorcolumn=join(range(81,999),",")

" Linenumbers
set number

syntax on
set ruler

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key-Remap Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Use tab and shift tab in insert for indent/unindent in insert mode a bol
inoremap <S-Tab> <C-d>

" Cycle completion menu on tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Move line up/down (alt-k, alt-j) and duplicate line (alt-shift-d)
" Note: Keyboard dependent and probably OSX only
nnoremap ∆ ddkP
nnoremap ˚ ddp
nnoremap Î yyp

" Disable arrow keys
" inoremap <Up> <NOP>
" inoremap <Down> <NOP>
" inoremap <Right> <NOP>
" inoremap <Left> <NOP>
" nnoremap <Up> <NOP>
" nnoremap <Down> <NOP>
" nnoremap <Right> <NOP>
" nnoremap <Left> <NOP>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Other Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab indentation settings: Tabs with 4 cols; Mark tabs, trail spaces and eol
" set list listchars=tab:▸\ ,trail:∙,eol:¬
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
set backupdir=~/.vim//
set directory=~/.vim//
set undodir=~/.vim//

" No error bells
set noerrorbells


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
