" Chun's Plugin Configuration
"
" All plugins will be managed by vim-plug, ensure that vim-plug is installed

call plug#begin('$HOME/.config/nvim/general/plugins')

Plug 'liuchengxu/eleline.vim'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let g:dracula_colorterm = 0
colorscheme dracula
