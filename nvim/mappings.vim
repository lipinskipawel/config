" <leader> <leader> switches between buffers
nnoremap <leader><leader> <c-^>

" remove current file from buffer
nnoremap <leader>b :bdelete<CR>

" find and replace highlighted text - substitute
vnoremap <leader>re "hy:%s/<C-r>h//gc<left><left><left>

" find and replace highlighted word/word's
vnoremap <leader>rw "hy:%s/\<<C-r>h\>//gc<left><left><left>

" quick-save
nmap <leader>w :w!<CR>

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

" switch between buffers using arrows
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Keep cursor at the center of screen while finding next element
nnoremap n nzzzv
nnoremap N Nzzzv

" when moving lines up, your cursor stays in the same spot
nnoremap J mzJ`z
