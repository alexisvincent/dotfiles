if has("gui_running") " all this for gui use
  " ugly MacVim Cruft
  set guioptions-=r " Remove scrollbars
  set guioptions-=R " Remove scrollbars
  set guioptions-=l " Remove scrollbars
  set guioptions-=L " Remove scrollbars
  set guioptions-=T " Remove toolbars
  set guioptions-=e " Remove default tabs
  set guifont=Knack\ Nerd\ Font:h16
  
  if has("gui_macvim") || has("gui_vimr")
    let macvim_skip_colorscheme = 1 " like A CSS Reset:
    " set fuoptions=maxvert,maxhorz
  endif
endif

syntax enable
set cursorline
" set nolazyredraw
set encoding=utf8
set linespace=0

set background=dark

"colorscheme spacegray
"colorscheme hybrid
"colorscheme flatlandia
colorscheme gruvbox
