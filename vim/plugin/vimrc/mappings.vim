" READ 
" http://vimcasts.org/episodes/creating-mappings-that-accept-a-count/
" http://vimcasts.org/blog/2014/02/follow-my-leader/
" https://github.com/AndrewRadev/splitjoin.vim/issues/14

" Quick Escape
" See: http://danielmiessler.com/blog/using-jk-vs-jj-for-esc-remapping-in-vim-steve-losh
inoremap jk <Esc>

" Move up and down DISPLAYED lines - saner with wrapped text
nnoremap j gj
nnoremap k gk

" ` is more useful than ' but less accessible.
nnoremap ' `
nnoremap ` '

" Use c-\ to do c-] but open it in a new split.
nnoremap <c-\> <c-w>v<c-]>zvzz

" Center the cusor line when jumping changes
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Make Y behave like C and D, yank to EOL
nn Y y$

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Quick Save.
nmap <Leader>w :w<CR>
nmap <Leader>W :w!<CR>

" Missing ZZ and ZQ counterparts:
" quick save-buffer and quit-everything
nnoremap ZS :w<CR>
nnoremap ZW :w!<CR>
nnoremap ZA :wa!<CR>
nnoremap ZX :qa<CR>

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>

" = Edit Sibling/Adjacent/Nearby Files
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

"= Tabs 
" Handle tabs like the rest of OS X Tabs and Spaces

" C-TAB and C-SHIFT-TAB cycle tabs forward and backward
nmap <c-tab> :tabnext<cr>
imap <c-tab> <c-o>:tabnext<cr>
vmap <c-tab> <c-o>:tabnext<cr>
nmap <c-s-tab> :tabprevious<cr>
imap <c-s-tab> <c-o>:tabprevious<cr>
vmap <c-s-tab> <c-o>:tabprevious<cr>

" C-# switches to tab; 
nmap <d-1> 1gt
nmap <d-2> 2gt
nmap <d-3> 3gt
nmap <d-4> 4gt
nmap <d-5> 5gt
nmap <d-6> 6gt
nmap <d-7> 7gt
nmap <d-8> 8gt
nmap <d-9> 9gt

" Hard Re-wrap Paragraphs (Textmate)
nnoremap <leader>q gqip

" Hard Re-wrap and leave cursor at current word after formatting
nnoremap <leader>qw gwip 

" Space to toggle folds.
" (Space is our leader, so double tap)
nnoremap <Leader><Space> za
vnoremap <Leader><Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO