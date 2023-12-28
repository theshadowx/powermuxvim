"-----------------------------------------
"Enable syntax highlighting, plugins
syntax on
filetype plugin indent on

set shell=bash
set term=screen-256color
set encoding=utf-8
set termencoding=utf-8

set showtabline=2
set cursorline
set hlsearch

set noswapfile
set clipboard=unnamedplus

set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab

"required to make powerline work for VIM
set noshowmode
set laststatus=2
set t_Co=256
set rtp+=$HOME/.local/lib/python3.8/site-packages/powerline/bindings/vim

"---------------------------------------
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END   

"---------------------------------------
" disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"---------------------------------------
" move between tmux and vim
function! TmuxMove(direction)
  let wnr = winnr()
  silent! execute 'wincmd ' . a:direction
  " If the winnr is still the same after we moved, it is the last pane
  if wnr == winnr()
          call system('tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR'))
  end
endfunction

nnoremap <silent> <c-h> :call TmuxMove('h')<cr>
nnoremap <silent> <c-j> :call TmuxMove('j')<cr>
nnoremap <silent> <c-k> :call TmuxMove('k')<cr>
nnoremap <silent> <c-l> :call TmuxMove('l')<cr>

"---------------------------------------
"Plugins install (vim-plug)
"----------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'      "gruvbox color scheme
Plug 'scrooloose/nerdtree'  "NerdTree
Plug 'Yggdroot/indentLine'  "Indent line
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

call plug#end()

"---------------------------------------
"Plugins configs
"----------------------------------------

"gruvbox
set background=dark
silent! colorscheme gruvbox

"NerdTree
nmap <F6> :NERDTreeToggle<CR>

"IndentLine
let g:indentLine_char="\u2502"

"---------------------------------------
"remove trailing space whenever :w is executed
autocmd BufWritePre * %s/\s\+$//e
