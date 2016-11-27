set runtimepath^=~/.vim/bundle/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.vim/bundle'))
" ============================================================================[ Dein
call dein#add('Shougo/dein.vim')
" ========================================================[ Vim Proc - Async Support
call dein#add('Shougo/vimproc.vim',   {'build': 'make'})
" =====================================================================[ VimSensible 
" Defaults everyone can agree on
call dein#add('tpope/vim-sensible')
" ========================================================================[ NERDTree 
call dein#add("scrooloose/nerdtree")
source ~/.vim/pluginrc/nerdtree.vim
" =================================================================[ NERDTreeSideBar 
call dein#add("jistr/vim-nerdtree-tabs") | source ~/.vim/pluginrc/nerdtreetabs.vim
" ==================================================================[ Nerd Commenter 
call dein#add('scrooloose/nerdcommenter')
" ===========================================================[ Ask To Make Directory 
call dein#add("jordwalke/VimAutoMakeDirectory")
" ==============================================================[ Revision Visulizer 
call dein#add("sjl/gundo.vim")
nnoremap <D-U> :GundoToggle<CR>
let g:gundo_close_on_revert=1
" ===========================================================[ Plugin Repeat Support 
call dein#add("tpope/vim-repeat")
" ===============================================================[ Better Tab Titles
call dein#add("mkitt/tabline.vim") | source ~/.vim/pluginrc/tabline.vim
" ======================================================================[ Easymotion
call dein#add('easymotion/vim-easymotion') | source ~/.vim/pluginrc/easymotion.vim
" =======================================================================[ Vim Shell
call dein#add("Shougo/vimshell.vim")
" ==========================================================================[ Ctrl-p 
call dein#add("ctrlpvim/ctrlp.vim") | source ~/.vim/pluginrc/ctrlp.vim
" ==========================================================================[ VimBox 
source ~/.vim/plugins.vimbox.vim
" =========================================================================[ Numbers 
call dein#add("myusuf3/numbers.vim")
" ===================================================================[ Gruvbox Color 
call dein#add("morhetz/gruvbox")
" ========================================================[ Experimental Tag Support 
"call dein#add('ludovicchabant/vim-gutentags')
" ==============================================================[ Javascript Support 
call dein#add('pangloss/vim-javascript')
"NeoBundle 'othree/yajs.vim'
"NeoBundle 'othree/es.next.syntax.vim'
call dein#add('othree/jspc.vim')
call dein#add('mxw/vim-jsx')
let g:jsx_ext_required = 0 " Support for JSX in .js ext
call dein#add('othree/javascript-libraries-syntax.vim')
let g:used_javascript_libs = 'react,underscore'
" =============================================================[ Tern for Javascript 
call dein#add('ternjs/tern_for_vim', { 'build' : '/usr/local/bin/npm install' })
" ====================================================================[ JSON Support 
call dein#add('elzr/vim-json')
" ===========================================================[ Padawan - PHP Support 
call dein#add('mkusher/padawan.vim')
let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
let g:padawan#composer_command = "composer"
" ===============================================================[ Autocomplete test
call dein#add("Shougo/neocomplete.vim")
set completeopt=menu,menuone,preview

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_auto_close_preview = 1
"let g:neocomplete#sources#syntax#min_keyword_length = 2
"let g:neocomplete#min_keyword_length = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#max_list = 15
set pumheight=15

let g:neocomplete#force_omni_input_patterns = {}
let g:neocomplete#force_omni_input_patterns.php = '\h\w*\|[^- \t]->\w*'

"call dein#add("Shougo/neopairs.vim")

" =======================================================================[ UltiSnips 
call dein#add("SirVer/ultisnips")
let g:UltiSnipsSnippetsDir="~/.vim/ultisnips"
"let g:UltiSnipsSnippetDirectories=["ultisnips"]

let g:UltiSnipsExpandTrigger="<D-CR>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <Tab>      pumvisible() ? "\<Down>": "\<tab>"
inoremap <expr> <S-Tab>    pumvisible() ? "\<Up>": "\<tab>"

inoremap <expr> <C-space>  pumvisible() ? "\<C-e>" : neocomplete#start_manual_complete(). ""

set splitbelow

" =====================================================================[ Finish Dein 
call dein#end()

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
