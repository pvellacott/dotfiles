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
set relativenumber
setlocal spell


call plug#begin('~/.config/nvim/plugins')

Plug 'EdenEast/nightfox.nvim'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'

call plug#end()

colorscheme carbonfox

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


let g:netrw_browse_split=2
let g:netrw_banner = 0
