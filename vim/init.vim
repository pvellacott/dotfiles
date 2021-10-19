" Install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set spelllang=en
set mouse=a
set clipboard=unnamed
setlocal spell


call plug#begin('~/.config/nvim/plugins')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-smooth-scroll'

call plug#end()

colorscheme gruvbox
set background=dark

let g:netrw_browse_split=2
let g:netrw_banner = 0
