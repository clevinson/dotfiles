" let Vundle manage Vundle, required

Plugin 'scrooloose/nerdtree'
Plugin 'derekwyatt/vim-scala'
Plugin 'dbext.vim'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'vim-scripts/Align'
" Plugin 'Shougo/neocomplete'
Plugin 'wlangstroth/vim-racket'
Plugin 'luochen1990/rainbow'
Plugin 'airblade/vim-gitgutter'
Plugin 'wincent/command-t'
" Plugin 'jszakmeister/vim-togglecursor'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'sjl/vitality.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'sophacles/vim-processing'
Plugin 'neomake/neomake'
Plugin 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plugin 'elmcast/elm-vim'
Plugin 'tomlion/vim-solidity'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'quramy/vim-js-pretty-template'
Plugin 'posva/vim-vue'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Rykka/InstantRst'
Plugin 'PratikBhusal/vim-grip'
Plugin 'styled-components/vim-styled-components'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'junegunn/fzf'
Plugin 'autozimu/LanguageClient-neovim', {
     \ 'branch': 'next',
     \ 'do': 'bash install.sh',
     \ }

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

" set p, c, and d to not yank the deleted text
xnoremap p pgvy
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

" " Copy to clipboard
vnoremap  y  "+y
nnoremap  Y  "+yg_
nnoremap  yy  "+yy
vnoremap  x  "+x
vnoremap  X  "+xg_

" " Paste from clipboard
" nnoremap p "+p
" nnoremap P "+P
" vnoremap p "+p
" vnoremap P "+P

let g:dbext_default_profile_redpanda = 'type=PGSQL:host=redpanda:user=cory:port=5432:dbname=redpanda'
let g:dbext_default_profile_workingpanda = 'type=PGSQL:host=workingpanda:user=cory:port=5432:dbname=workingpanda'
let g:dbext_default_profile_ladybug = 'type=PGSQL:host=localhost:user=root:port=5432:dbname=ladybug'
let g:dbext_default_profile = 'redpanda'

" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1

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
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold',
    \                           'start=/(/ end=/)/ containedin=vimFuncBody',
    \                           'start=/\[/ end=/\]/ containedin=vimFuncBody',
    \                           'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" NEOCOMPLETE STUFFZ
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" " Close popup by <Space>.
" "inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
" 
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
" vmap <silent>sf        <Plug>SQLU_Formatter<CR> 

" cusror shape settings
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" set cursor back to termianl settiongs (underscore)
au VimLeave * set guicursor=a:hor20-blinkon0

" fast-tags thingy
" Add these to your vimrc to automatically keep the tags file up to date.
" Unfortunately silent means the errors look a little ugly, I suppose I could
" capture those and print them out with echohl WarningMsg.
" au BufWritePost *.hs            silent !init-tags %
" au BufWritePost *.hsc           silent !init-tags %

" If you use qualified tags, then you have to change iskeyword to include
" a dot.  Unfortunately, that affects a lot of other commands, such as
" w, and \< \> regexes used by * and #.  For me, this is confusing because
" it's inconsistent with vim keys everywhere else.
" This binding temporarily modifies iskeyword just for the ^] command.
nnoremap <silent> <c-]> :setl iskeyword=@,_,.,48-57,39<cr><c-]>
    \:setl iskeyword=@,48-57,_,192-255<cr>


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" set help to open always in new tab
cabbrev help tab help

set listchars=tab:→\ ,trail:·,extends:#,nbsp:.
set list

" tab settings
set backspace=2
set tabstop=2 shiftwidth=2 expandtab ai

highlight LineNr ctermfg=blue ctermbg=NONE
highlight SignColumn ctermbg=blue

set number

set laststatus=2

" nnoremap <CR> :noh<CR><CR>
set nohlsearch
map <leader>h :set hlsearch!<cr><cr>


filetype plugin on
set omnifunc=syntaxcomplete#Complete

syntax enable
syntax on

au BufReadPost *.svelte set syntax=html

set mouse=a

" Goyo settings

function! s:goyo_enter()
  set noshowcmd
  set scrolloff=999
  set linebreak
  Limelight

endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  set nolinebreak
  Limelight!

endfunction


autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

au Filetype markdown Goyo 80
au Filetype txt Goyo 80

function! g:Goyo_before()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd BufLeave NERD_tree_* call feedkeys("\<C-w>=")
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! g:Goyo_after()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

let g:goyo_callbacks = [function('g:Goyo_before'), function('g:Goyo_after')]

autocmd FileType javascript JsPreTmpl html

" Disable default folding behavior in vim-markdown plugin
let g:vim_markdown_folding_disabled = 1



"===================================================================
" The following is all code for language server stuff !!
" Copied from: https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }
    " \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    " \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    " \ 'python': ['/usr/local/bin/pyls'],
    " \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
