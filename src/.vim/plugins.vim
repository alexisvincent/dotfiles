" =================================== NeoBundle ===================================
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" ================================================================================
" ================================== VimSensible ==================================
" Defaults everyone can agree on
NeoBundle "tpope/vim-sensible"

" ================================== NeoComplete ==================================
NeoBundle "Shougo/neocomplete.vim"
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" ============================= Nerd Commenter ======================================
NeoBundle 'scrooloose/nerdcommenter'

" ============================== VimAutoMakeDirectory ============================
" Asks to create directories in Vim when needed
NeoBundle "jordwalke/VimAutoMakeDirectory"

" ================================== VimRepeat ===================================
" Allow plugins to tap into repeating
NeoBundle "tpope/vim-repeat"

" ================================== TabLine ===================================
" Better tab titles
NeoBundle "mkitt/tabline.vim"
source ~/.vim/pluginrc/tabline.vim

" ================================= Easymotion ===================================
" Easy Motion Baby
NeoBundle 'easymotion/vim-easymotion'
source ~/.vim/pluginrc/easymotion.vim

" ================================= Ctrl-p =====================================
" See ~/.gvimrc as well
" Using the new official ctrlp (switched project maintainers)
NeoBundle "ctrlpvim/ctrlp.vim"
source ~/.vim/pluginrc/ctrlp.vim

" ================================= VimBox =====================================
source ~/.vim/plugins.vimbox.vim

" ================================= Numbers ====================================
NeoBundle "myusuf3/numbers.vim"

" =============================== Hybrid Color =================================
NeoBundle "w0ng/vim-hybrid"

" =============================== Gruvbox Color ================================
NeoBundle "morhetz/gruvbox"
 
" =========================== Padawan - PHP Support ============================
NeoBundle 'mkusher/padawan.vim'
let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
let g:padawan#composer_command = "php /path/to/composer.phar"

let g:neocomplete#force_omni_input_patterns = {}
let g:neocomplete#force_omni_input_patterns.php =
\ '\h\w*\|[^- \t]->\w*'

" =================== Web Dev Icons ===========================================
" NeoBundle "ryanoasis/vim-webdevicons"
" source ~/.vim/pluginrc/vimrc.devicons
" Can't get working (icons are cut in half vertically)

" ============================= Finish NeoBundle ===============================
call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
