"source ~/.vim/mappings.vimbox.vim

let mapleader = ","

nmap <D-/> ,c<space><cr>
vmap <D-/> ,c<space>
imap <D-/> <esc>,c<space>i



" Huge saver! Why do you need to press shift when executing a command?
nnoremap ; :

"Tab through your splits! (Shift tab won't ever work on terminal :( )
nmap <Tab> <c-w><c-w>
nmap <s-Tab> <c-w><s-w>

" space through your tabs!
map <Space> gt
" shift-space backwards - doesn't work on terminal, I believe
map <s-Space> gT

" Awesome visual selection maintained when indenting.
vmap <D-]> >gv
vmap <D-[> <gv
" Map Command-# to switch tabs
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt



" Toggle Spell Check Easily:
imap <D-P> <Esc>l:set spell!<Cr>
nmap <D-P> :set spell!<Cr>
