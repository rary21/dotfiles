if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/nvidia/.config/nvim/dein/repos/github.com/Shougo/dein.vim/,/home/nvidia/.config/nvim,/etc/xdg/nvim,/home/nvidia/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/nvidia/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/nvidia/.config/nvim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/nvidia/.config/nvim/init.vim', '/home/nvidia/.config/nvim/dein/toml/dein.toml', '/home/nvidia/.config/nvim/dein/toml/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/nvidia/.config/nvim/dein'
let g:dein#_runtime_path = '/home/nvidia/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/nvidia/.config/nvim/dein/.cache/init.vim'
let &runtimepath = '/home/nvidia/.config/nvim/dein/repos/github.com/Shougo/dein.vim/,/home/nvidia/.config/nvim,/etc/xdg/nvim,/home/nvidia/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/home/nvidia/.config/nvim/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/nvidia/.config/nvim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/nvidia/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/nvidia/.config/nvim/after'
filetype off
