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
"Plugins install (vim-plug)
"----------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'      "gruvbox color scheme
Plug 'scrooloose/nerdtree'  "NerdTree
Plug 'Yggdroot/indentLine'  "Indent line
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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


