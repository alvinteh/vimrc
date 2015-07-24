set nocompatible

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim

"Configure plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
call vundle#end() 

syntax on
filetype on
filetype plugin on
filetype indent on

set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set hlsearch
set incsearch
set nobackup
set noswapfile
set number
set ruler
set title
set ttyfast

"Set tab options
set ts=4 sts=4 sw=4 expandtab
autocmd BufWritePost * retab

"Set color scheme
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
"Keep solarized configuration as a backup
"set background=dark
"colorscheme solarized
colorscheme molokai

"Enable mouse support
if has('mouse')
    set mouse=a
endif

"Configure NERDTree
let NERDTreeHighlightCursorline=1
autocmd vimenter,BufRead,BufNewFile * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Configure Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Configure tagbar
nmap <F8> :TagbarToggle<CR>
autocmd vimenter * TagbarOpen

"Configure vim-airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

"Configure vim-gitgutter
autocmd vimenter * GitGutterEnable

"Configure vim-javascript
let g:javascript_enable_domhtmlcss = 1

