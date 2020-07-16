" if has("unix")
"     if empty(glob('~/.vim/autoload/plug.vim'))
"         silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/" vim-plug/master/plug.vim
"         autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"     endif
" endif

" if has("win32")
"     set langmenu=en_US.UTF-8  " sets the language of the menu (gvim)
"     language en
"     set guifont=Fira\ Code:h11
"     " set guioptions-=m  " remove menu bar
"     set guioptions-=T  " remove toolbar
"     set guioptions-=r  " remove right-hand scroll bar
"     set guioptions-=L  " remove left-hand scroll bar
" endif

call GuiWindowMaximized(1)

call plug#begin()
    " Plug 'jremmen/vim-ripgrep'
    " Plug 'liuchengxu/space-vim-dark'
    " Plug 'nikitavoloboev/vim-monokai-night'
    " Plug 'scrooloose/nerdcommenter'
    Plug 'codota/tabnine-vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'arcticicestudio/nord-vim'

    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'freitass/todo.txt-vim'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'vimwiki/vimwiki'
    Plug 'zah/nim.vim'
call plug#end()

set nocompatible    " be iMproved, required
filetype off        " required
set encoding=utf-8
syntax on

set hlsearch   " Highlight all search results
set incsearch  " Find the next match as we type the search
set smartcase  " Enable smart-case search

set backspace=indent,eol,start
set fileformat=unix
set fileformats=unix,dos

set number relativenumber
set showmode
set shortmess=I

set showmatch   " Highlight matching brace
set visualbell  " Use visual bell (no beeping)

" set directory=C:\Users\Asus\.vim\tmp

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" colorscheme desert
" colorscheme monokai-night
" colorscheme space-vim-dark
colorscheme nord

" map! <F3> <C-R>=strftime('%d.%m.%Y')<CR>
" map! <F4> <C-R>=strftime('%H:%M')<C-R>
nnoremap <silent> <Space> :nohlsearch <Bar>:echo<CR>
map q: :
" nnoremap <Tab> :echom "Tab"<cr>
inoremap jk <esc>

let g:airline_theme='nord'
let g:airline_enable_fugitive=1

" autocmd VimLeavePre * silent mksession! C:\Users\Asus\.vim\lastSession.vim
" autocmd VimEnter * silent source! C:\Users\Asus\.vim\lastSession.vim

let mapleader = "\<Space>"
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
