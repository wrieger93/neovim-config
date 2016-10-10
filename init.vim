" {{{ plugins

" install vim-plug first

call plug#begin()

" general

" fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" automatically insert bracket pairs
" Plug 'jiangmiao/auto-pairs'

" easily comment/uncomment lines
Plug 'tpope/vim-commentary'

" awesome git stuff
Plug 'tpope/vim-fugitive'

" repeat plugin maps with .
Plug 'tpope/vim-repeat'

" easily change surrounding parentheses and stuff
Plug 'tpope/vim-surround'

" easily align characters
Plug 'godlygeek/tabular'

" 'dark powered neo-completion'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" 'asynchronous :make'
Plug 'neomake/neomake'

" ui

" colorschemes

Plug 'NLKNguyen/papercolor-theme'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'

" nice statusbar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'kien/rainbow_parentheses.vim'

" c++

" code completion
Plug 'Rip-Rip/clang_complete'

" haskell

" better highlighting/indentation
Plug 'neovimhaskell/haskell-vim', { 'for': [ 'haskell', 'cabal' ] }

" code completion
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

" html

" omnicomplete and syntax
Plug 'othree/html5.vim'

" python

" external omnifunc for deoplete
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" vim

" code completion
Plug 'Shougo/neco-vim', { 'for': 'vim' }

call plug#end()

" }}}

" general settings

" ui
set background=dark
colorscheme gruvbox

set cursorline
set number
set relativenumber
set scrolloff=7
set showmatch
set title

" searching
set ignorecase
set magic
set smartcase

" tabs are 4 spaces
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" misc

" make buffers work as expected
set hidden

" .tex files are latex
let g:tex_flavor='latex'

" always have the sign column open
augroup sign_column
    autocmd!
    autocmd BufEnter * sign define dummy
    autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END

" custom stuff

" save read-only file with sudo
cnoremap w!! w !sudo tee > /dev/null %

" make j and k wrap over long lines
nnoremap j gj
nnoremap k gk

nnoremap H ^
nnoremap L $

" quickly sort lines alphabetically
vnoremap gs :sort<cr>

" quickly leave insert mode
inoremap jk <esc>

" leader commands

let mapleader=" "
let maplocalleader="\\"

" quick save
nnoremap <leader>w :w<cr>

" quickly open and source nvimrc
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" align equal signs
nnoremap <leader>a= :Tabularize /=<cr>
vnoremap <leader>a= :Tabularize /=<cr>

" plugin config

" deoplete

call deoplete#enable()

" airline

let g:airline_theme='gruvbox'
let g:airline_left_sep=''
let g:airline_right_sep=''

" vim-surround

" use 'c' to surround with a latex command
" e.g. ysiwc on a word lets you type a command and produces \command{word}
let g:surround_{char2nr('c')}='\\\1command\1{\r}'

let g:clang_complete_auto=0
let g:clang_auto_select=0
let g:clang_omnicppcomplete_compliance=0
let g:clang_make_default_keymappings=0
"let g:clang_use_library = 1

let g:clang_library_path='/usr/lib/llvm-3.8/lib/libclang.so'
