set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'sheerun/vim-polyglot'

Plugin 'tpope/vim-surround'

Plugin 'vimsence/vimsence'

call vundle#end()
filetype plugin indent on
syntax enable
colorscheme sorbet

syntax on
set number
set modeline
set cursorline
set expandtab
set tabstop=4
set shiftwidth=4
set incsearch
set showmatch
set ignorecase
set hlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set notimeout
