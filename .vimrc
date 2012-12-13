" Added as part of vim pathogen installation.
filetype off
call pathogen#infect()
syntax on
filetype plugin indent on

" Leave vi behind
set nocompatible

" Apparently there are security problems with modelines
set modelines=0

" I like numbers
set number

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Nice behavior
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" Searching
" Better regex (perl/python) for searching
nnoremap / /\v
vnoremap / /\v
" Ignore case when searching if all lowercase
set ignorecase
set smartcase
" Highlight searches
set incsearch
set showmatch
set hlsearch
" Clear highlighted search
nnoremap <leader><space> :noh<cr>
" Match brackets
nnoremap <tab> %
vnoremap <tab> %

" Handle long lines properly
set wrap
set textwidth=79
set formatoptions=qrn1
if has('colorcolumn')
    set colorcolumn=80
endif

" No more arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" F1 really means ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Just gonna try out jj as ESC
inoremap jj <ESC>

" Tabbing
:command NN tabnext
:command PP tabprevious

" Load a local file, if present
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
