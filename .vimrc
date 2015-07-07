" Pathogen stuff:
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Some of my own settings:

" Leave vi behind
set nocompatible

" Apparently there are security problems with modelines
set modelines=0

" I like numbers
set number

" Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
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

" Handle long lines properly
set nowrap
set textwidth=127
set formatoptions=qrn1
set colorcolumn=128

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

" 'jj' maps to escape to leave insert mode.
inoremap jj <ESC>

" Added from: http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
" The following plugins are expected:
" https://github.com/tpope/vim-surround.git
" https://github.com/tpope/vim-git
" https://github.com/ervandew/supertab
" https://github.com/wincent/Command-T
" https://github.com/mitechie/pyflakes-pathogen
" https://github.com/mileszs/ack.vim
" https://github.com/fs111/pydoc.vim.git
" https://github.com/vim-scripts/pep8
" https://github.com/davidhalter/jedi-vim
" https://github.com/pangloss/vim-javascript
" Add new plugs with:
" git submodule add /path/to/repo bundle/<name>
" Update plugins:
" git submodule init
" git submodule update
" git submodule foreach git submodule init
" git submodule foreach git submodule update

" Simply enable syntax highlighting
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Load a local file, if present
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
