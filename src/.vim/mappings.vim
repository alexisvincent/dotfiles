source ~/.vim/mappings.vimbox.vim

autocmd! bufwritepost *vim* source $MYVIMRC

let mapleader = ","

nmap <D-/> ,c<space>
vmap <D-/> ,c<space>
imap <D-/> <esc>,c<space>i*/
