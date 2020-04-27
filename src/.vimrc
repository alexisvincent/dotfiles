"source ~/.vim/misc.before.vim
"source ~/.vim/plugins.vim
"source ~/.vim/gui.vim
"source ~/.vim/mappings.vim
"source ~/.vim/functions.vim
"source ~/.vim/misc.after.vim
nnoremap o o<Esc>
nnoremap O O<Esc>
syntax on
"execute pathogen#infect()
"call pathogen#helptags()
"autocmd vimenter * NERDTree
"map <C-n> :NERDTreeToggle<CR>
filetype plugin indent on
colorscheme badwolf
let g:badwolf_darkgutter = 1
let g:badwolf_html_link_underline = 0
let g:badwolf_tabline = 2
let g:badwolf_css_props_highlight = 1
let g:ale_lint_on_insert_leave = 1
"set shiftwidth=4
set autoindent
set smartindent
"inoremap } {}<ESC>ha
"inoremap { {<CR><BS>}<Esc>ko
set number " show line numbers
set ttyfast
" let g:badwolf-transparent = 1 " set badwolf transparency
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " numbor of spaces in tab when editing
"set expandtab " sets tabs to spaces, for languages that prefer spaces
set showcmd " shows the last command entered in the bottom right
set cursorline " highlights the line the cursor currently sits on
filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
set showmatch " highlight the matching parenthesis or bracket or brace
set incsearch " search as characters are entered
set hlsearch " highlight matches when searching
nnoremap <leader><space> :nohlsearch<CR> 
"Vim will keep highlighted matches from searches until you either run a new one or manually stop highlighting the old search with :nohlsearch. I find myself running this all the time so I've mapped it to ,<space>.
set foldenable " enables vim folding
set foldlevelstart=10 " open most folds by default
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
