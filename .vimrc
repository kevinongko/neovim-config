"-----Plugins-----"
call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'gregsexton/MatchTag'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'posva/vim-vue'
Plug 'raimondi/delimitmate'
Plug 'rakr/vim-one'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'sirver/ultisnips'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"-----Theme-----"
set termguicolors
let g:one_allow_italics = 1
colorscheme one
set background=dark

"-----Plugins-Config-----"

"--Vim-Closetag--"
let g:closetag_filenames = "*.html,*.xhtml,*.phtml" "highlight close tag

"--Vim-Airline--"
let g:airline_powerline_fonts = 1 "powerline font for airline
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 0 "buffer indicator

"--CtrlP--"
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower\|vendor\|public\|storage' "ctrlp ignore folders
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20' "ctrlp visual

"--NerdTree--"
let NERDTreeShowHidden=1 "show hidden files
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.swp$'] "hide certain file types
let NERDTreeCascadeSingleChildDir=0 "disable auto collapse single children folder
autocmd StdinReadPre * let s:std_in=1 "auto open NerdTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "auto open NerdTree if no file

"--UltiSnip--"
let g:UltiSnipsExpandTrigger = '<leader>us'

"--PHP-CS-Fixer--"
let g:php_cs_fixer_path = "~/Projects/php-cs-fixer.phar" "define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "psr2" "which level ?
let g:php_cs_fixer_fixers_list = "-psr0" "Disable PSR-0.
let g:php_cs_fixer_config = "default" "configuration
let g:php_cs_fixer_php_path = "php" "Path to PHP
let g:php_cs_fixer_dry_run = 0 "Call command with dry-run option
let g:php_cs_fixer_verbose = 0 "Return the output of command if 1, else an inline information.

"--syntastic--"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-----Vim-Config-----"
let mapleader = ' '
set autoindent
set backspace=indent,eol,start
set clipboard=unnamed
set copyindent
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set nowrap
set number
set ruler
set shiftwidth=4
set showcmd
set showmode
set smartcase
set smarttab
set softtabstop=4
set t_Co=256
set tabstop=4
syntax on
filetype plugin indent on
"highlight Comment cterm=italic
highlight htmlArg cterm=italic

"-----Key-Mapping-----"
set pastetoggle=<F3>
map <F2> <C-W>w
map <F4> :FixWhitespace <CR>
map <F5> :NERDTreeTabsToggle <CR>
nmap <F6> :TagbarToggle<CR>
nmap <leader><space> :nohlsearch <CR>

"--Laravel--"
nmap <leader>lm :!php artisan make:

"--Split--"
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"--Tab--"
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

"-----Auto-Commands-----"

"--Auto-source-vimrc--"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

"--PHP-auto-namespace--"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

"--Sync-syntax--"
autocmd BufEnter * :syntax sync fromstart

"--Spacing-file-types--"
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype less setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=4 sts=4 sw=4
autocmd Filetype twig setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype blade setlocal ts=4 sts=4 sw=4
autocmd Filetype htmldjango.twig setlocal ts=2 sts=2 sw=2
autocmd Filetype html.twig setlocal ts=2 sts=2 sw=2
autocmd Filetype xhtml.twig setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
