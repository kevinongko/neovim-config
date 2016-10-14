"-----plugins-----"
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'raimondi/delimitmate'
Plug 'mhinz/vim-startify'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gregsexton/MatchTag'
Plug 'alvan/vim-closetag'
Plug 'sirver/ultisnips'
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
call plug#end()

"-----theme-----"
set termguicolors
set background=dark
colorscheme molokai

"-----plugin config-----"
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"                              "highlight close tag
let g:airline_powerline_fonts = 1                                                "powerline font for airline
let g:airline#extensions#tabline#enabled = 0                                     "buffer indicator
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower\|vendor\|public\|storage' "ctrlp ignore folders
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'            "ctrlp visual
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.swp$']

"-----vim config-----"
let mapleader = ' '
set autoindent
set backspace=indent,eol,start
set copyindent
set expandtab
set hlsearch
set incsearch
set ignorecase
set laststatus=2
set nowrap
set number
set ruler
set showmode
set showcmd
set smartcase
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set t_Co=256
set mouse=a
set clipboard=unnamed
syntax on
filetype plugin indent on
highlight Comment cterm=italic
highlight htmlArg cterm=italic

"-----key mapping-----"
set pastetoggle=<F3>
map <F2> <C-W>w
map <F4> :FixWhitespace <CR>
map <F5> :NERDTreeTabsToggle <CR>
nmap <leader><space> :nohlsearch <CR>

"split mapping
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"tab mapping
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

"-----auto commands-----"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

autocmd BufEnter * :syntax sync fromstart

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2

"au BufRead,BufNewFile *.vue set filetype=html
