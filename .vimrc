set nocompatible " Disable vi-compatibility
set t_Co=256

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
" undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
" :help undo-persistence
" This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

filetype plugin indent on

syntax enable
set background=dark
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
set scrolloff=8 " start scrolling before reaching the end
set showmode " always show what mode we're currently editing in
set nowrap " don't wrap lines
set textwidth=0
set wrapmargin=0
set tabstop=4 " a tab is four spaces
set hidden " hide buffers instead of closing them
set smarttab
set tags=tags
set softtabstop=4 " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab " expand tabs by default (overloadable per file type later)
set shiftwidth=4 " number of spaces to use for autoindenting
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set number " always show line numbers
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase,
set timeout timeoutlen=500 ttimeoutlen=100
set visualbell " don't beep
set noerrorbells " don't beep
set autowrite " Save on buffer switch
set mouse=a
let g:vim_json_syntax_conceal = 0 " Fix double quotes bug in .json files

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saves
nmap <leader>w :w!<cr>

" Common typos
nmap :W :w
nmap :Q :q

" Save from system clipboard (OS X)
imap <D-V> ^O"+p

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Easy escaping to normal mode
inoremap jk <esc>
inoremap <esc> <nop>

" Auto change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" easier window navigation

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap <C-c> :vertical resize -5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

nmap <C-b> :NERDTreeToggle<cr>

" Load the current buffer in Chrome
" nmap ,c :!open -a Google\ Chrome<cr>

" Show (partial) command in the status line
set showcmd

" Create split below
nmap :sp :rightbelow sp<cr>

" Move between buffers
nmap <leader>gt :bn<cr>
nmap <leader>gT :bp<cr>

highlight Search cterm=underline

" Swap files out of the project root
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//

" Run Codeception tests
nmap <leader>t :!clear && codecept run<cr>

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Resource vim config files when saving
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost .vimrc.bundles source %
autocmd! bufwritepost .vimrc.bundles.config source %

" Unfold all when opening a buffer
au BufWinEnter * normal zR

" Indent spaces by file type
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype blade setlocal ts=2 sts=2 sw=2

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

" Redo
nnoremap U :redo<cr>

" Open .vimrc file for editing
cnoremap vrc tabe ~/.vimrc

" Use The Silver Searcher over grep, iff possible
if executable('ag')
" Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor
endif

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/
