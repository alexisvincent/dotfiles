" Collection of Clean Vim ColorSchemes With Airline Themes
" NeoBundle "jordwalke/VimCleanColors"

"Always have a nice view for vim split windows
" NeoBundle 'zhaocai/GoldenView.Vim'
" let g:goldenview__enable_default_mapping = 0 " Disable mappings

" ==============================================================================
call dein#add("tpope/vim-fugitive")
call dein#add("gregsexton/gitv")
"Neither of these two commands seem to do what I want
let g:Gitv_OpenHorizontal = 1
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" ==============================================================================

" ==============================================================================
" NeoBundle "jreybert/vimagit"
" ==============================================================================

" Windows:
" Need dependent package to be installed.
" You must copy the dlls to the gvim directory usually C:\Program Files (x86)\vim\vim73
"
" Bundle "xolox/vim-misc"
" Bundle "xolox/vim-shell"
" Trouble: can_use_dll is returning false :/ Version number !== .5

" ====================== Vim Surround ==========================================
call dein#add("tpope/vim-surround")
" ==============================================================================


" =================== TODO, Check Out:==========================================
" https://github.com/bootleq/vim-gitdiffall
" ==============================================================================



" " ========================== Unite.vim uses ====================================
" Disabling Unite for now since it's unclear how to configure it to work with
" VimBox's paradigm.
" NeoBundle 'Shougo/vimproc', {
"       \ 'build' : {
"       \     'windows' : 'make -f make_mingw32.mak',
"       \     'cygwin' : 'make -f make_cygwin.mak',
"       \     'mac' : 'make -f make_mac.mak',
"       \     'unix' : 'make -f make_unix.mak',
"       \    },
"       \ }
"
" NeoBundle "Shougo/unite.vim"
" source ~/.vim/pluginrc/vimrc.unite

" =============================== Thumbnail ====================================
" NeoBundle "itchyny/thumbnail.vim"
" ==============================================================================

" =============================== Better Markdown ==============================
call dein#add("tpope/vim-markdown")
" ==============================================================================

" =============================== Session = ====================================
call dein#add("xolox/vim-misc")
call dein#add("xolox/vim-session")
" let g:session_autosave_periodic = 0  "Every three minutes + on close seems fine.
" But saving resets window dims!
let g:session_autosave = 'yes'       "Auto-save on close
let g:session_autoload = 'no'

" Make sure to save sessions outside of your dotfiles in case you publish your
" dotfiles to github etc.
" The Session Directory
let g:session_directory="~/.vim_sessions"
" ==============================================================================

" My custom session management GUI tools (in menu bar) Based on one of the
" other session managers.
set runtimepath+=~/.vim/bundle_local/sessions
set runtimepath+=~/.vim/bundle_local/wowcamldebug

" ================================ VimJSDocSnippets ============================
call dein#add('jordwalke/VimJSDocSnippets')
if has('gui_win32')
  let g:JSDocSnippetsMapping='<S-M-c>'
else
  let g:JSDocSnippetsMapping='<D-C>'
endif
" ==============================================================================


" ==================== Best Pair Tool Ever =====================================
call dein#add("MartinLafreniere/vim-PairTools")
source ~/.vim/pluginrc/pairtools.vim
" ==============================================================================


" ========================== Cocoa Vim =========================================
" NeoBundle "msanders/cocoa.vim"
" ==============================================================================


call dein#add("AndrewRadev/splitjoin.vim")


" =================================== LastTab  =================================
" See .keysVimRc
call dein#add("jordwalke/VimLastTab")
" ==============================================================================


" =================================== Closer  ==================================
" Go to Left when closing like everything else in the world
call dein#add("jordwalke/VimCloser")
" ==============================================================================


" TODO: Look into the following
" NeoBundle "xolox/vim-colorscheme-switcher"

" =============================== SmartGUITabs =================================
"call dein#add("jordwalke/MacVimSmartGUITabs")
" Make sure to have `set guioptions+=e` in your `.gvimrc`.
"map <D-Cr> :SmartGUITabsToggleFullScreen<CR>
"imap <D-Cr> <Esc>:SmartGUITabsToggleFullScreen<CR>
"nmap <D-Cr> <Esc>:SmartGUITabsToggleFullScreen<CR>
" ==============================================================================


" ==============================================================================


" ============================ OCaml ===========================================
" Bundles installed with OPAM:
" ==============================================================================
"Merlin AutoComplete:
"Just install OCaml/OPAM
" # wget http://www.ocamlpro.com/pub/opam_installer.sh
" # sh ./opam_installer.sh /usr/local/bin 4.00.1
"
" > To find the "share_dir", do: `opam config var share`
" < /Users/jwalke/.opam/4.00.1/share
"
" Hacked ACP to support this and haxe.
if !empty(system('which opam'))
  " =================================== Merlin ================================
  " Set the log file and restart:
  " let $MERLIN_LOG = '/Users/you/merlinlogfile'
  let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','') . "/merlin"
"    execute "set rtp+=".s:ocamlmerlin."/vim"
"    execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
  let g:syntastic_ocaml_checkers=['merlin']
else
  " TODO: figure out opam for windows
endif

" ==============================================================================

" =================================== OCP-indent ================================
" This is a better version than what comes directly out of OPAM (it does not
" destroy undo/redo).
"call dein#add("def-lkb/ocp-indent-vim")
" ==============================================================================


" ======================= Toggle quickfix/location ============================
" See .keysVimRc
call dein#add("milkypostman/vim-togglelist")
let g:toggle_list_copen_command="bo copen 30"
let g:toggle_list_lopen_command="bo copen 30"
" =============================================================================

" ======================= Easy Grep ===========================================
call dein#add("yegappan/grep")
let Grep_Skip_Files = '*.byte *.depends *.cmi *.cmx *.orig *.back *.cmo *.o *~'
let Grep_Skip_Dirs = 'RCS CVS SCCS _build .git'
" =============================================================================


" ======================= A lighterweight Powerline ============================
call dein#add("jordwalke/vim-airline")
if has("gui_macvim") || has("gui_vimr")
  autocmd VimEnter * set guioptions+=e
endif
let g:airline_powerline_fonts = 1
set laststatus=2
" Disable truncation
let g:airline#extensions#default#section_truncate_width = {}
" ==============================================================================


" ==================================== Syntastic ================================
call dein#add("scrooloose/syntastic")
" TODO: Disable signs in merlin/syntastic, and only use the VimHint strategy of
" underlining *just* the region of error.
let g:syntastic_enable_signs=0
let g:syntastic_always_populate_loc_list=1
let g:syntastic_loc_list_height=15
let g:syntastic_javascript_checkers=['flow']
" let g:syntastic_warning_symbol=""
" let g:syntastic_error_symbol=""
" highlight link SyntasticErrorLine Spellbad
" highlight link SyntasticWarningLine Spellbad
" highlight link SyntasticStyleErrorLine Spellbad
" highlight link SyntasticStyleWarningLine Spellbad
" For OCaml (which uses syntastic + merlin) always show the sign gutter
" otherwise it's jarring when it appears.
" autocmd FileType ocaml sign define dummy
" autocmd FileType ocaml execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" ==============================================================================



" ==================================== TaskList ================================
" NeoBundle "vim-scripts/TaskList.vim"
" ==============================================================================



" ================================== Expand-Region =================================
" NeoBundle "terryma/vim-expand-region"

" Override the default expand region to avoid paragraphs and lines, and also add
" "around" braces/brackets/parens/quotes. Remove "W" word - it extends beyond
" paren boundaries in an unbalanced way.
"let g:expand_region_text_objects = {
      "\ 'iw'  :0,
      "\ 'i"'  :0,
      "\ 'i''' :0,
      "\ 'i]'  :1,
      "\ 'ib'  :1,
      "\ 'iB'  :1,
      "\ 'a]' :1,
      "\ 'ab' :1,
      "\ 'aB' :1,
      "\ 'a"'  :0,
      "\ 'a''' :0
      "\ }
" ==============================================================================




" ================================== Smooth-Scroll =================================
call dein#add("terryma/vim-smooth-scroll")
"Normal mode
noremap <silent> <c-u> :call smooth_scroll#up(40, 20, 6)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(40, 20, 6)<CR>

" smooth_scroll is broken in visual mode currently - unmap
vnoremap <silent> <c-u> <c-u>
vnoremap <silent> <c-d> <c-d>
" ==============================================================================



" ================================= Flatlandia ==================================
"call dein#add("jordwalke/flatlandia")
" ==============================================================================


" ================================= Solarized ==================================
"call dein#add("altercation/vim-colors-solarized")
"default value is 1
"let g:solarized_underline=0
"default value is 16
"let g:solarized_termcolors=256
"default value is normal
"let g:solarized_contrast="high"
"default value is normal
"let g:solarized_visibility="high"
" ==============================================================================



" ================================== Headlights ================================
" Shows all plugin options as menu items like textmate bundles!
" NeoBundle 'mbadran/headlights'
"let g:headlights_use_plugin_menu = 1;
" let g:headlights_smart_menus = 1
" ==============================================================================


" ============================= ACP Forked =========================
" Check out snippets in ~/.vim/personalSnippets/
"call dein#add("jordwalke/AutoComplPop")
"let g:acp_ignorecaseOption = 1

" ==============================================================================



" ==============================================================================

" ======== Combine Previous Plugins For Modern Completion Experience ===========
"call dein#add("jordwalke/VimCompleteLikeAModernEditor")
" ==============================================================================

" ============================= Commenter ======================================
" NeoBundle "tomtom/tcomment_vim"
call dein#add('scrooloose/nerdcommenter')
" ==============================================================================


" =============================Javascript-Indent================================
" I suspect this is doing nothing since JavaScript-Indent overwrites the
" indentation hooks, but I cannot prove it.
call dein#add("pangloss/vim-javascript")
" ==============================================================================

" =============================Javascript-Indent================================
call dein#add("vim-scripts/JavaScript-Indent")
" ==============================================================================

call dein#add("mxw/vim-jsx")

" ========================= Simulator Refresh ==================================
" 'delay 0.5\n tell application "iOS Simulator"\n activate\n tell application "System Events"\n keystroke "r" using command down\n end tell\n end tell'
"function! RefreshTheSimulator()
  "silent :!osascript -e 'delay 0.5' -e 'tell application "iOS Simulator"' -e 'activate' -e 'tell application "System Events"' -e 'keystroke "r" using command down' -e 'end tell' -e 'activate me' -e 'end tell'
  "redraw!
  "if (has('gui_macvim'))
    "silent :!ps -xc|grep -sq MacVim && osascript -e 'tell app "MacVim"' -e 'activate' -e 'end tell'
  "endif
"endfunction
":command! RefreshSimulator :call RefreshTheSimulator()
" ==============================================================================


" ================================= Less========================================
" NeoBundle "groenewege/vim-less"
" ==============================================================================



" ======================= Parameter Text Objects ===============================
" ciP  (change in paramater  - changes the single argument under cursor!
call dein#add("vim-scripts/Parameter-Text-Objects")
" ==============================================================================


" ==============================================================================

" ========================== Undo Quit of a window =============================
call dein#add("AndrewRadev/undoquit.vim")
map <D-T> <Esc>:Undoquit<CR>
" ==============================================================================
