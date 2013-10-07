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

" Handle long lines properly
set nowrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

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

" Django stuff from: http://blog.fluther.com/django-vim/
" ENABLE OMNICOMPLETION
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" hamlpy and sass auto-compilation
autocmd BufWritePost *.hamlpy !hamlpy <afile> > <afile>:r.html
"autocmd BufWritePost *.py !pyflakes <afile>
"autocmd BufWritePost *.js !jshint <afile>

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

" you will be able to be inside a method and type 'za' to open and close a fold.
"set foldmethod=indent
"set foldlevel=99

" Window splitting
"Vertical Split : Ctrl+w + v
"Horizontal Split: Ctrl+w + s
"Close current windows: Ctrl+w + q
" Ctrl+<movement> keys to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Simply enable syntax highlighting
syntax on                    " syntax highlighing
filetype on                  " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

" pyflakes doesn't use quickfix window
let g:pyflakes_use_quickfix = 0

" jump to each of the pep8 violations in the quickfix window:
let g:pep8_map='<leader>8'

" set python autocomplete context
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Load a local file, if present
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
