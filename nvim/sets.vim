set relativenumber
set number

" make cursor to be always block, even in insert mode
set guicursor=

" in case of copying from vim to...
se mouse+=a

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

map H ^
map L $

" Permament undo
set undodir=~/.config/nvim/.vimdid
set undofile
