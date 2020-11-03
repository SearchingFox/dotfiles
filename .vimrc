if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'arcticicestudio/nord-vim'
    Plug 'bling/vim-airline'
    Plug 'vimwiki/vimwiki'
    Plug 'zah/nim.vim'
call plug#end()

if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

set nocompatible
filetype off
set encoding=utf-8
syntax on

set hlsearch   " Highlight all search results
set incsearch  " Find the next match as we type the search
set smartcase  " Enable smart-case search

set number relativenumber
set showmode
set shortmess=I
set showmatch    " Highlight matching brace
set visualbell   " don't beep
set noerrorbells " don't beep
set hidden       " hides buffers instead of closing them

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme nord

map! <F3> <C-R>=strftime('%d.%m.%Y')<CR>
map! <F4> <C-R>=strftime('%H:%M')<C-R>
nnoremap <silent> <Space> :nohlsearch <Bar>:echo<CR>
map q: :
