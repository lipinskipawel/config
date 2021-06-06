set relativenumber
set number

" make cursor to be always block, even in insert mode
set guicursor=

" Stop newline continuation of comments
set formatoptions-=cro

" on highlight on search
set nohlsearch

" set indent as a fold and don't fold by default
set foldmethod=indent
set foldlevelstart=99

" keeps buffer in the background
set hidden

" use \c at the end of search for the same result as this command
set ignorecase

" no sounds
set noerrorbells

" no wrapping lines
set nowrap

" start scrolling when you are close to bottom
set scrolloff=8

" share system clipboard with vim
set clipboard=unnamedplus

map H ^
map L $

" Permament undo
set undodir=~/.config/nvim/.vimdid
set undofile

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=100
