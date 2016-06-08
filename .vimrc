set nocompatible


"----------------------------------------
" Disable file type options for Syntastic
"----------------------------------------
filetype off
filetype plugin off
filetype indent off
set runtimepath+=$GOROOT/misc/vim


"----------------------------------------
" Configure plugins
"----------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'easymotion/vim-easymotion'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()


"----------------------------------------
" Configure file type options
"----------------------------------------
syntax on
filetype on
filetype plugin on
filetype indent on


"----------------------------------------
" Configure visual options
"----------------------------------------
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set lazyredraw
set listchars=trail:·
set list
set nobackup
set noswapfile
set number
set ruler
set scrolloff=3
set title
set ttyfast
set wildmenu


"----------------------------------------
" Configure color scheme
"----------------------------------------
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
colorscheme molokai


"----------------------------------------
" Configure search
"----------------------------------------
set hlsearch
set incsearch
set showmatch


"----------------------------------------
" Configure code folding
"----------------------------------------
set foldenable
set foldlevelstart=6
set foldmethod=indent
nnoremap <space> za


"----------------------------------------
" Configure spacing and tabs
"----------------------------------------
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
" Override spacing for specific file types
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab
" Retab before writing files
autocmd BufWritePre * retab
" Strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e


"----------------------------------------
" Configure automatic paste modes
"----------------------------------------
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
" Delete into black hole register
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP


"----------------------------------------
" Configure movement
"----------------------------------------
" Set j and k to move vertically by visual line
nnoremap j gj
nnoremap k gk


"----------------------------------------
" Configure mouse support
"----------------------------------------
if has('mouse')
    set mouse=a
endif


"----------------------------------------
" Configure NERDTree
"----------------------------------------
let NERDTreeHighlightCursorline=1
let NERDTreeShowHidden=1
" Launch NERDTree on launch
autocmd vimenter * NERDTree
" Focus on the file buffer on launch
autocmd vimenter * wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Close all buffers if the only buffer left is NERDTree
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction


"----------------------------------------
" Configure Syntastic
"----------------------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" Setup Syntastic to use local ESLint
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')


"----------------------------------------
" Configure tagbar
"----------------------------------------
nmap <F8> :TagbarToggle<CR>
"autocmd vimenter,BufRead,BufNewFile * TagbarOpen


"----------------------------------------
" Configure vim-airline
"----------------------------------------
let g:airline#extensions#tabline#enabled = 1
set laststatus=2


"----------------------------------------
" Configure vim-gitgutter
"----------------------------------------
autocmd vimenter,BufRead,BufNewFile * GitGutterEnable


"----------------------------------------
" Configure vim-indent-guides
"----------------------------------------
autocmd vimenter * IndentGuidesToggle


"----------------------------------------
" Configure vim-javascript
"----------------------------------------
let g:javascript_enable_domhtmlcss = 1


"----------------------------------------
" Configure vim-jsx
"----------------------------------------
let g:jsx_ext_required = 0
