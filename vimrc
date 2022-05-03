" ~/.vimrc
" ```bash
" # install vim plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ```

" Encoding {{{
set encoding=utf-8
scriptencoding utf-8
"set ambiwidth=double
" }}} Encoding

" UI & Color {{{
set showcmd
set number
set cursorline
set visualbell t_vb=
set showmatch
set laststatus=2
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=[%l,%c%V]%8P
set wildmenu wildmode=list:full
syntax on
colorscheme ron
" }}} UI & Color

" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

" Search {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" }}} Search

" General {{{
set hidden
set nocompatible  " for vim-polyglot
set nobackup
set noswapfile
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif " no indent when paste
" }}} General

"---------"
"set path+=/usr/include
"set path+=/usr/include/c++/8
"set dictionary=/usr/share/dict/words
"---------"
"imap { {}<LEFT>
"imap ( ()<LEFT>
"imap [ []<LEFT>
"---------"

" vim -b : edit binary using xxd-format!
augroup Binary
  autocmd!
  autocmd BufReadPre  *.bin let &binary=1
  autocmd BufReadPost * if &binary | %!xxd
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r
  autocmd BufWritePre * endif
  autocmd BufWritePost * if &binary | %!xxd
  autocmd BufWritePost * set nomod | endif
augroup END

call plug#begin()
Plug 'sheerun/vim-polyglot'
call plug#end()
