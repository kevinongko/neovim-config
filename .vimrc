"-----vim plugins-----"

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'gregsexton/MatchTag'
Plug 'alvan/vim-closetag'
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'wavded/vim-stylus'
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-jade'
Plug 'xsbeats/vim-blade'
Plug 'evidens/vim-twig'
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
call plug#end()





"-----plugin config-----"

let g:closetag_filenames = "*.html,*.xhtml,*.phtml"                              "highlight close tag
let g:airline_powerline_fonts = 1                                                "powerline font for airline
let g:airline#extensions#tabline#enabled = 0                                     "buffer indicator
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower\|vendor\|public' "ctrlp ignore folders

"auto open nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif





"-----vim config-----"

color PaperColor
let mapleader = ' '
set autoindent
set background=dark
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
set smartcase
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set t_Co=256
syntax enable





"-----key mapping-----"

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
