" <leader> <leader> switches between buffers
nnoremap <leader><leader> <c-^>

" quick-save
nmap <leader>w :w<CR>

" replacing highlighted text with the text from implicit register
vnoremap <leader>p "_dP

" save and reload vim
nnoremap <leader>rv :w \| :source $MYVIMRC<CR>

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" switch between buffers using arros
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
