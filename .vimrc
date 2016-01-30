" vim plugins
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
Plug 'bling/vim-airline'
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

" plugin config
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower\|vendor\|public'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim config
color gruvbox
set autoindent
set backspace=indent,eol,start
set number
set ruler
set nowrap
set hlsearch
set laststatus=2
set tabstop=4 shiftwidth=4 expandtab
set background=dark
set t_Co=256
syntax enable

" key mapping
map <F2> <C-W>w
map <F3> :tabnext <CR>
map <F4> :FixWhitespace <CR>
map <F5> :NERDTreeTabsToggle <CR>
