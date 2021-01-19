" Chun's vim bindings
"
" Remap VIM 0 to first non-blank character
map 0 ^

" Escape buttons
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

" Maps shell commands to hotkeys
nnoremap <leader>d :!mkdir<Space>
nnoremap <leader>m :!mv<Space>%<Space>

"Toggle autocommenting
map <leader>c :setlocal formatoptions-=cro<CR>

" Better split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Calling splits
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>

" Tab completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Toggle highlighting
map <leader>o :setlocal hlsearch<CR>

" Keybind for replcing text
nnoremap S :%S//gI<Left><Left><Left>

