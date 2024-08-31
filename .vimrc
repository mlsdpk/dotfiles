syntax on
set exrc
set guicursor=
set relativenumber
set hlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
" set isfname+=@-@
" " set ls=0
"
" " Give more space for displaying messages.
" set cmdheight=1
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=50
"
" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c
"
" set colorcolumn=80

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-signify'
Plug 'preservim/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

set background=dark    " Setting dark mode
colorscheme gruvbox

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

if !has('gui_running')
  set t_Co=256
endif

map <TAB> :NERDTreeToggle<cr>
