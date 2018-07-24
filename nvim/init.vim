set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set softtabstop=0
set autoindent
set smartindent
set number
set guifont=Ricty:h14
set showtabline=2
set termguicolors
set noswapfile

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

colorscheme desert

" for ALE 
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {'cpp': ['clang'],
			\		'python': ['autopep8']
			\}


" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.config/nvim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/dotfiles/nvim/dein/toml')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
