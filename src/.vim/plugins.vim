") =================================== NeoBundle ===================================
"set runtimepath+=~/.vim/bundle/neobundle.vim/
if &compatible
  set nocompatible
endif
set runtimepath^=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
"call neobundle#begin(expand('~/.vim/bundle/'))
call dein#begin(expand('~/.vim/bundle'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')
let g:dein#install_process_timeout=600 " Increase this to support the long YCM compile step...

" =======================================================[ Vim Proc - Async Support ]
call dein#add('Shougo/vimproc.vim',   {'build': 'make'})

" ================================== VimSensible ==================================
" Defaults everyone can agree on
call dein#add('tpope/vim-sensible')

" =======================================================[ Autocomplete test ]
call dein#add('Valloric/YouCompleteMe') " Remember to manually compile!
" ./install.py --clang-completer --tern-completer


" =================================== NERDTree =================================
" Q : How can I open a NERDTree automatically when vim starts up if no files
" were specified?  A : NerdTreeTabs handles this
call dein#add("scrooloose/nerdtree")
source ~/.vim/pluginrc/nerdtree.vim
" Also see ~/.vim/nerdtree_plugin/myMappings.vim (NERDTree requires mappings
" exist there)
" ==============================================================================

" ============================= NERDTreeSideBar ================================
call dein#add("jistr/vim-nerdtree-tabs")
source ~/.vim/pluginrc/nerdtreetabs.vim

" ============================= Nerd Commenter ======================================
call dein#add('scrooloose/nerdcommenter')

" ============================== VimAutoMakeDirectory ============================
" Asks to create directories in Vim when needed
call dein#add("jordwalke/VimAutoMakeDirectory")

" ============================ GUndo ============================================
" Visualize a tree of your document history
call dein#add("sjl/gundo.vim")
nnoremap <D-U> :GundoToggle<CR>
let g:gundo_close_on_revert=1

" ================================== VimRepeat ===================================
" Allow plugins to tap into repeating
call dein#add("tpope/vim-repeat")
" ===================================================[ Better tab titles - TabLine ]
call dein#add("mkitt/tabline.vim") | source ~/.vim/pluginrc/tabline.vim
" ====================================================================[ Easymotion ]
call dein#add('easymotion/vim-easymotion') | source ~/.vim/pluginrc/easymotion.vim
" =====================================================================[ Vim Shell ]
"call dein#add("Shougo/vimshell.vim")
" ================================= Ctrl-p =====================================
call dein#add("ctrlpvim/ctrlp.vim") | source ~/.vim/pluginrc/ctrlp.vim
" ================================= VimBox =====================================
source ~/.vim/plugins.vimbox.vim
" ================================= Numbers ====================================
call dein#add("myusuf3/numbers.vim")
" =============================== Gruvbox Color ================================
call dein#add("morhetz/gruvbox")
" =============================== Experimental Tag Support ================================
call dein#add('ludovicchabant/vim-gutentags')
" ============================= Javascript Support ================================
call dein#add('pangloss/vim-javascript')
"NeoBundle 'othree/yajs.vim'
"NeoBundle 'othree/es.next.syntax.vim'
call dein#add('othree/jspc.vim')
call dein#add('mxw/vim-jsx') | let g:jsx_ext_required = 0 " Support for JSX in .js ext
call dein#add('othree/javascript-libraries-syntax.vim') | let g:used_javascript_libs = 'react,underscore'
" ============================= Tern for Javascript ================================
call dein#add('ternjs/tern_for_vim', { 'build' : '/usr/local/bin/npm install' })


" =========================== JSON Support ============================
call dein#add('elzr/vim-json')


" =========================== Padawan - PHP Support ============================
call dein#add('mkusher/padawan.vim')
let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
let g:padawan#composer_command = "composer"

"let g:neocomplete#force_omni_input_patterns = {}
"let g:neocomplete#force_omni_input_patterns.php = '\h\w*\|[^- \t]->\w*'

" ============================= UltiSnips ======================================
"See corresponding entries in `.keysVimRc`.
call dein#add("SirVer/ultisnips")
"let g:UltiSnipsSnippetsDir="~/.vim"
"let g:UltiSnipsSnippetDirectories=["ultisnips"]

" ============================= Finish Dein ===============================
call dein#end()

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

