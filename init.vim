"-----Plugins-----"
call plug#begin('~/.config/nvim/plugged')

"--feature--"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'
Plug 'bronson/vim-trailing-whitespace'
Plug 'gregsexton/MatchTag'
Plug 'jiangmiao/auto-pairs'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'kassio/neoterm'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

"--colorscheme--"
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-two-firewatch'
Plug 'romainl/flattened'
Plug 'tomasr/molokai'

"--syntax--"
Plug 'StanAngeloff/php.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'jwalton512/vim-blade'
Plug 'lumiliet/vim-twig'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'wavded/vim-stylus'

call plug#end()

"-----Colorscheme-config-----"
set termguicolors
colorscheme flattened_dark
set background=dark
"let g:two_firewatch_italics=1
"let g:molokai_original = 1

"-----Plugins-config-----"

"--stylus-hightlight-flex--""
hi link stylusProperty cssVisualProp

"--Vim-Airline--"
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 0 "buffer indicator
let g:airline_powerline_fonts = 1 "powerline font for airline

"--NerdTree--"
let NERDTreeShowHidden=1 "show hidden files
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '\.swp$', '.gitkeep', '.gitattributes', '.idea', '.vscode'] "hide certain file types
let NERDTreeCascadeSingleChildDir=0 "disable auto collapse single children folder

"--NeoSnippets--"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

"--NeoTerm--"
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = ',tt'

"--Closetag--"
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.vue"

"--Deoplete--"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources.php = ['file', 'buffer', 'tag', 'member', 'neosnippet']
let g:deoplete#sources.javascript = ['file', 'buffer', 'tag', 'member', 'neosnippet']
let g:deoplete#sources.vue = ['file', 'buffer', 'tag', 'member', 'neosnippet']
let g:deoplete#sources.stylus = ['file', 'buffer', 'tag', 'member', 'omni']
let g:deoplete#sources.sass = ['file', 'buffer', 'tag', 'member', 'omni']
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.stylus = ['\w+', '\w+[):;]?\s+\w*', '[@!]']

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
set laststatus=1
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
nmap <leader>lr :T php artisan route:list

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
    autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END

"--Sync-syntax--"
autocmd! BufEnter * :syntax sync fromstart

"--Delete-white-space-on-save--"
autocmd! BufWritePre * FixWhitespace

"--Set-stylus-omnifunction--"
autocmd FileType stylus setlocal omnifunc=csscomplete#CompleteCSS

"--Spacing-file-types--"
autocmd Filetype blade setlocal ts=4 sts=4 sw=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype html.twig setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype less setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype sass setlocal ts=4 sts=4 sw=4
autocmd Filetype scss setlocal ts=4 sts=4 sw=4
autocmd Filetype stylus setlocal ts=4 sts=4 sw=4
autocmd Filetype twig setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
