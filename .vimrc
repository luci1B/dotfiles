execute pathogen#infect()

" General settings

" Vim not Vi
set nocompatible

set encoding=utf-8
set fileencoding=utf-8
" Use utf-8 by default
set fileencodings=utf-8

" Enable filetype-specific indenting and plugins
filetype plugin indent on

" Enable syntax
syntax on

" Put out temp files in /tmp
set directory=/tmp/

" Fastest TTY ever
set ttyfast

set autoindent
set smartindent

let mapleader=" "

" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>l :set list!<cr>

set clipboard=unnamed

" set number
set number
set ruler
set cursorline
set scrolloff=999

" use indents of 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" show bracket matches
set showmatch

" Search
set incsearch
set ignorecase
set hlsearch
set smartcase

set textwidth=150
set colorcolumn=+1

set t_Co=256
set background=dark
colorscheme molokai

" powerline status bar
source /Users/lucien/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
set showtabline=2
set noshowmode

nnoremap k gk
nnoremap j gj
nnoremap 0 g0
nnoremap $ g$


if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolo
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_caching = 0
endif

set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction

inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

nnoremap <Leader><Leader> :CtrlP<CR>
au BufNewFile,BufRead *.tpl :set ft=html " all my .tpl files ARE html
au BufNewFile,BufRead js.*.tpl :set ft=javascript " all my js.*.tpl files ARE JavaScript
