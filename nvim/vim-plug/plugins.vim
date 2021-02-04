call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'

    " This will cause vim to look at the root of git project
    Plug 'airblade/vim-rooter'

    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " GUI enhancements
    Plug 'itchyny/lightline.vim'

call plug#end()

