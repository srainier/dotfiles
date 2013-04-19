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

"Many people like to remove any extra whitespace from the ends of lines. Here is one way to do it when saving your file.
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

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

" Just gonna try out jj as ESC
inoremap jj <ESC>

" Tabbing
:command NN tabnext
:command PP tabprevious

" Django stuff from: http://blog.fluther.com/django-vim/
" ENABLE OMNICOMPLETION
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" DJANGO_SETTINGS_FILE=myapp.settings vim

" employinsight hamlpy and sass auto-compilation
autocmd BufWritePost *.hamlpy !hamlpy <afile> > <afile>:r.html
"autocmd BufWritePost *.scss !fab sass
autocmd BufWritePost *.py !pyflakes <afile>
autocmd BufWritePost *.js jshint <afile>

" Load a local file, if present
if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif
