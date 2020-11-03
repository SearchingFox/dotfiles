call plug#begin()
    Plug 'arcticicestudio/nord-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'cocopon/iceberg.vim'
    Plug 'codota/tabnine-vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vimwiki/vimwiki'
    Plug 'zah/nim.vim'
call plug#end()

set encoding=utf-8
set hlsearch
set number relativenumber
set showmode
set showmatch   " Highlight matching brace
set visualbell  " Use visual bell (no beeping)

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme iceberg

let g:airline_theme='iceberg'
let g:airline_enable_fugitive=1

let mapleader = "\<Space>"
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p

" nnoremap <Tab> :echom "Tab"<cr>
" map! <F3> <C-R>=strftime('%d.%m.%Y')<CR>
" map! <F4> <C-R>=strftime('%H:%M')<C-R>
inoremap jk <esc>
nnoremap <silent> <Space> :nohlsearch <Bar>:echo<CR>
map q: :

set guifont=Julia\ Mono:h17

function! SaveSession()
  if g:sessionfile != ""
    echo "Saving session!"
    exe "mksession! " . g:sessionfile
  endif
endfunction

function! LoadSession()
  if argc() == 0
    let g:sessionfile = $HOME . "/AppData/Local/nvim/sessions/session.vim"
    if (filereadable(g:sessionfile))
      exe 'source ' g:sessionfile
    else
      echo "Can't load session!"
    endif
  endif
endfunction

au VimEnter * nested :call LoadSession()
au VimLeave * :call SaveSession()

" autocmd VimLeavePre * silent mksession! C:\Users\Asus\.vim\lastSession.vim
" autocmd VimEnter * silent source! C:\Users\Asus\.vim\lastSession.vim

" neovim-qt
" Guifont! JetBrains Mono:h12
" call GuiWindowMaximized(1)
