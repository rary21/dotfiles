set clipboard=unnamedplus
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set cindent
set number
set guifont=Ricty:h14
set showtabline=2
set termguicolors
set noswapfile
set bs=2

inoremap jj <ESC>
nnoremap x "_x
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap n nzz
nnoremap N Nzz
nnoremap Y y$
nnoremap <space><space> i<space><esc>
nnoremap <space>e :NERDTree<cr>
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>
vnoremap < <gv
vnoremap > >gv
noremap <space>h ^
noremap <space>l $
noremap <space>/ *
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" ノーマルモードで IME OFF
autocmd InsertLeave * :call system('fcitx5-remote -c')

set hlsearch
set showmatch

filetype plugin indent on
set syntax=enable

colorscheme desert

