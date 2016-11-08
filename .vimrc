"-----Plugins-----"
call plug#begin('~/.vim/plugged')
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'morhetz/gruvbox'
"Plug 'rakr/vim-one'
"Plug 'tomasr/molokai'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'gregsexton/MatchTag'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kassio/neoterm'
Plug 'neomake/neomake'
Plug 'posva/vim-vue'
Plug 'raimondi/delimitmate'
Plug 'romainl/flattened'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"-----Theme-----"
set termguicolors
colorscheme flattened_dark
set background=dark

"-----Plugins-Config-----"

"--Vim-Airline--"
let g:airline#extensions#tabline#enabled = 0 "buffer indicator
let g:airline_powerline_fonts = 1 "powerline font for airline
let g:airline_theme='solarized'

"--NerdTree--"
let NERDTreeShowHidden=1 "show hidden files
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.swp$', '.gitkeep', '.gitattributes'] "hide certain file types
let NERDTreeCascadeSingleChildDir=0 "disable auto collapse single children folder

"--NeoSnippets--"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"--Deoplete--"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources.php = ['file', 'buffer', 'tag', 'member']
let g:deoplete#sources.javascript = ['file', 'buffer', 'tag', 'member']
let g:deoplete#sources.vue = ['file', 'buffer', 'tag', 'member']
let g:deoplete#sources.stylus = ['file', 'buffer', 'tag', 'member', 'omni']
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.stylus = ['\w+', '\w+[):;]?\s+\w*', '[@!]']

"--PHP-CS-Fixer--"
let g:php_cs_fixer_level = "psr2" "which level ?
let g:php_cs_fixer_fixers_list = "-psr0" "Disable PSR-0.
let g:php_cs_fixer_config = "default" "configuration
let g:php_cs_fixer_php_path = "php" "Path to PHP
let g:php_cs_fixer_dry_run = 0 "Call command with dry-run option
let g:php_cs_fixer_verbose = 0 "Return the output of command if 1, else an inline information.

"--NeoMake--"
let g:neomake_vue_eslint_maker = {
\ 'args': ['-f', 'compact'],
\ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
\ '%W%f: line %l\, col %c\, Warning - %m'
\ }

let g:neomake_warning_sign = {
\ 'text': 'W',
\ 'texthl': 'WarningMsg',
\ }

let g:neomake_error_sign = {
\ 'text': 'E',
\ 'texthl': 'ErrorMsg',
\ }

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_php_enabled_makers = ['php']
let g:neomake_vue_enabled_makers = ['eslint']

"-----Vim-Config-----"
let mapleader = ' '
set autoindent
set backspace=indent,eol,start
set clipboard=unnamed
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete
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
"highlight htmlArg cterm=italic

"-----Key-Mapping-----"
set pastetoggle=<F3>
map <F1> :FZF <CR>
map <F2> <C-W>w
map <F4> :FixWhitespace <CR>
map <F5> :NERDTreeTabsToggle <CR>
nmap <leader><space> :nohlsearch <CR>
map <C-P> :FZF <CR>

"--Laravel--"
nmap <leader>la :T php artisan
nmap <leader>lm :T php artisan make:

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

"--NeoSnippets--"
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


"-----Auto-Commands-----"

"--Auto-source-vimrc--"
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

"--Sync-syntax--"
autocmd! BufEnter * :syntax sync fromstart

"--Delete-white-space-on-save--"
autocmd! BufWritePre * FixWhitespace

"--Run-neomake-on-save--"
autocmd! BufWritePost,BufEnter * Neomake

"--Set-stylus-omnifunction--"
autocmd FileType stylus setlocal omnifunc=csscomplete#CompleteCSS

"--Spacing-file-types--"
autocmd Filetype blade setlocal ts=4 sts=4 sw=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype html.twig setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype less setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype scss setlocal ts=4 sts=4 sw=4
autocmd Filetype stylus setlocal ts=4 sts=4 sw=4
autocmd Filetype twig setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
