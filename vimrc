" don't bother with vi compatibility
set nocompatible

" enable syntax highlighting
syntax enable

" configure Vundle
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
call vundle#end()

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on

set autoindent
set autoread                       " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                    " Fix broken backspace in some setups
set backupcopy=yes                 " see :help crontab
if $TMUX == ''
  set clipboard=unnamed            " yank and paste with the system clipboard
endif
set directory-=.                   " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                      " expand tabs to spaces
set ignorecase                     " case-insensitive search
set incsearch                      " search as you type
set laststatus=2                   " always show statusline
set list                           " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                         " show line numbers
set ruler                          " show where you are
set scrolloff=3                    " show context above/below cursorline
set shiftwidth=2                   " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                      " case-sensitive search if any caps
set softtabstop=2                  " insert mode tab and backspace use 2 spaces
"set spell spelllang=en_us
set tabstop=8                      " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                       " show a navigable menu for tab completion
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" keyboard shortcuts
let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>d :NERDTreeToggle<CR>
" nmap <leader>f :NERDTreeFind<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>

" plugin settings
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 1

" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set nocursorline " don't highlight current line

" keyboard shortcuts
inoremap jj <ESC>

" gui settings
if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
  colorscheme desert
endif

" Use Powerline fonts
let g:airline_powerline_fonts = 1

" Enable gitgutter
let g:gitgutter_enabled = 1

" Set up clang-format
map <C-I> :pyf ~/.vim/clang-format.py<CR>
imap <C-I> <ESC>:pyf ~/.vim/clang-format.py<CR>

" Allow doxygen triple-slash comments
autocmd Filetype c,cpp set comments^=:///

" set up pencil
augroup pencil
  autocmd!
  " Force soft link breaks
  autocmd FileType markdown,mkd,mk,tex call pencil#init({'wrap': 'soft'})

  " Force hard line breaks in text files
  autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

" Markdown stuff
let g:vim_markdown_folding_disabled = 1
