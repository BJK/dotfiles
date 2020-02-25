let mapleader = "\<Space>"

" softabs, 2 space bruh
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite


" Split edit your vimrc. Type space, v, r, in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

" window command instead of ctrl-w
nmap <leader>wl <c-w>l
nmap <leader>wh <c-w>h
nmap <leader>wj <c-w>j
nmap <leader>wk <c-w>k

" nerd tree binding
map <C-n> :NERDTreeToggle<CR>

" Plugins, using vim-plug for now
call plug#begin('~/.vim/plugged')
  Plug 'pangloss/vim-javascript' " base javascript highlighter
  Plug 'mxw/vim-jsx' " react jsx highlighter
  Plug 'tpope/vim-rails'
  Plug 'scrooloose/nerdtree'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'sickill/vim-monokai'
  Plug 'tpope/vim-fugitive'
  Plug 'grassdog/tagman.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tomlion/vim-solidity'
call plug#end()
" customize the plugins
"
let g:jsx_ext_required = 0 " be cool with jsx files that have .js at the end, bruh

" The Silver Searcher
if executable('ag')
   " Use ag over grep, stolen from
   " https://robots.thoughtbot.com/faster-grepping-in-vim
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  
  " this thing here, rules, basically do a fast search and open a quick window
  " with the results, for you sublime peeps

  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" syntax highlighting fun
syntax on
syntax enable
colorscheme monokai " this depends on the monokai plugin, but makes colors look like the sublime home I came from 


" enable advanced matchit features
runtime macros/matchit.vim
