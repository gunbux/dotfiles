" Chun's General Vim Settings (iPad)
"
" Table of Contents
" 1 - Basic settings
" 2 - Vim UI
" 3 - Fonts
" 4 - Files, backups and undo
" 5 - Text, ab and indent related
" 6 - Visual Mode related 
" 7 - Moving around, tabs, windows and buffers
" 8 - Status line
"
" 1. Basic Settings
"
" Use UTF-8
set encoding=UTF-8

" Enable Filetype Plugins (Disable if laggy)
filetype plugin on
filetype indent on

" Enable mouse
set mouse=a

" Set vim history
set hstory=100

" Remeber the line vim was last on when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Set mapleader
let mapleader=" "

" Quick save options
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>e :q!<CR>

" Sudo save
cmap w!! w !sudo tee %

" Remove any leading whitespaces
autocmd BufWritePre * %s/\s+$//e

"Fix Splitting
set splitbelow splitright

"2 - Vim User Interface

"Always show current position
set ruler

" Ignore case + smart case
set ignorecase
set smartcase

" Make search more modern
set incsearch

" Don't redraw when using macro
set lazyredraw

" For regex
set magic

" Set relative number
set number relativenumber

" 3 - Colours and fonts

" Enable syntax highlighting
syntax enable on

" 4 - Files, backup and undo
"
" Turn backups off
set nobackup
set nowb
set noswapfile

" Sets persistent undo
try 
	set undodir=~/.vim_runtime/temp_dirs/undodir
		set undofile
catch
endtry

" 5 - Text, tab and indent related
"
" Use spaces insteado of tabs
set expandtab

"Use smart tabs
set smarttab

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wraps lines

"Linebreak
set lbr
set tw=600

" 6- Visual mode related
"
" Better tabbing in visual mode
vnoremap < <gv
vnoremap > >gv

" 7 - Moving around, tabs, windows and buffers

" Close current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use alt + hjkl to resize windows
nnoremap <M-j>	:resize -2<CR>
nnoremap <M-k>	:resize +2<CR>
nnoremap <M-h>	:vertical resize -2<CR>
nnoremap <M-l>	:vertical resize -2<CR>

" Use mappingsfor managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Let 'tl' toggle between current and last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" Opens new tab with current buffer's path
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to directory of open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

