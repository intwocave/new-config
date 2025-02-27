set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" ~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Main Plugin Manager

Plugin 'tomasiser/vim-code-dark'
" color scheme

Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
" Print Git Branch on airline status bar

Plugin 'scrooloose/nerdtree'
" FileTree Plugin with map <Leader>nt <ESC>:NERDTree<CR>

Plugin 'airblade/vim-gitgutter'
" Notice differences with git's repo

Plugin 'scrooloose/syntastic'
" Notice syntastic errors

Plugin 'Valloric/YouCompleteMe' " 'Valloric/YouCompleteMe' 수동 플러그인 설치
" Autocomplete Plugin

" Plugin 'davidhalter/jedi-vim'
" Python Autocomplete를 위한 플러그인

Plugin 'wakatime/vim-wakatime'

" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set nu " 줄번호
set tabstop=4 " 탭의 길이
set softtabstop=4 " 실제 벌어지는 탭의 간격
set hlsearch " 하이라이트 서치
set scrolloff=4 " 스크롤할 때 여분의 공간을 두어 보기 쉽게 한다.
set shiftwidth=4 "자동 들여쓰기의 너비 설정
set clipboard=unnamedplus
map <Leader>nt <ESC>:NERDTree<CR>
" NERDTree의 키 매핑.. 노멀 모드에서 \nt를 입력하면 바로 실행됨

colorscheme codedark
let g:airline_theme = 'codedark'
" vim-code-dark 스키마를 적용

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1

set backspace=indent,eol,start  " more powerful backspacing

set encoding=utf-8

" set shellcmdflag=-ic " Vim Shell을 Interactive 상태로 만들어 Alias를 사용할 수 있게 한다.
