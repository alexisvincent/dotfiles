let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

map <D-e> :NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
imap <D-e> <Esc>:NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
vmap <D-e> <Esc>:NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
nmap <D-e> <Esc>:NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>

map <D-E> :NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr><c-w><c-w><c-w><c-p>
imap <D-E> <Esc>:NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr><c-w><c-w><c-w><c-p>
vmap <D-E> <Esc>:NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr><c-w><c-w><c-w><c-p>
