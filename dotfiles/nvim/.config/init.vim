""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" ... a universal set of defaults that (hopefully) everyone can agree on.
Plug 'tpope/vim-sensible'
" Python autocompletion and linting
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
" Un-/Comment line with 'gcc'
Plug 'tpope/vim-commentary'
" Powerline like status bar
Plug 'itchyny/lightline.vim'
" Show indentation when indented with spaces
Plug 'Yggdroot/indentLine'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin Setups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable deoplete autocompletion, set tab completion and autoclose preview
let g:deoplete#enable_at_startup = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
autocmd CompleteDone * pclose!

" Lightline color scheme
let g:lightline = {'colorscheme': 'wombat'}

" Indent guides (space indentation only, for tabs see below)
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black ctermbg=Black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=DarkGray

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Other Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Filename completion
set wildmenu
set wildmode=longest,list

" Color every column gretaer than 80
highlight ColorColumn ctermbg=DarkGrey
let &colorcolumn=join(range(81,999),",")

" Linenumbers
set number

" Tab indentation settings: Tabs with 4 cols; Mark tabs, trail spaces and eol
set list listchars=tab:▸\ ,trail:∙,eol:¬
highlight NonText ctermfg=DarkGrey
highlight SpecialKey ctermfg=DarkGrey
set tabstop=4
set shiftwidth=4
set noexpandtab

" Use tab and shift tab in insert for indent/unindent in insert mode a bol
inoremap <S-Tab> <C-d>

" Cycle completion menu on tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

