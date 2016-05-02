set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
Plugin 'dbext.vim'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'vim-scripts/Align'
Plugin 'Shougo/neocomplete'
Plugin 'wlangstroth/vim-racket'
Plugin 'luochen1990/rainbow'
Plugin 'airblade/vim-gitgutter'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


map <C-n> :NERDTreeToggle<CR>

let g:dbext_default_profile_redpanda = 'type=PGSQL:host=redpanda:user=cory:port=5432:dbname=redpanda'
let g:dbext_default_profile_workingpanda = 'type=PGSQL:host=workingpanda:user=cory:port=5432:dbname=workingpanda'
let g:dbext_default_profile_ladybug = 'type=PGSQL:host=localhost:user=root:port=5432:dbname=ladybug'
let g:dbext_default_profile = 'redpanda'

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:sqlutil_align_comma = 1
let g:sqlutil_align_where = 0
let g:sqlutil_align_keyword_right = 1
let g:sqlutil_wrap_expressions = 0
let g:sqlutil_keyword_case = '\U'

let g:rainbow_active = 1

    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'darkmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)



inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
vmap <silent>sf        <Plug>SQLU_Formatter<CR> 

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" set help to open always in new tab
cabbrev help tab help

set listchars=tab:→\ ,trail:·,extends:#,nbsp:.
set list

set backspace=2
set tabstop=2 shiftwidth=2 expandtab ai

highlight LineNr ctermfg=grey ctermbg=black
highlight SignColumn ctermbg=blue

set relativenumber
set number

au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber


set laststatus=2


filetype plugin on
set omnifunc=syntaxcomplete#Complete

syntax enable
syntax on
