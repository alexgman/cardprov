" Always wrap long lines:
set wrap
set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = ','

syntax on

" ==== colorscheme ====
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" =====================

filetype plugin indent on

let g:dbext_default_profile_mySQLServerSQLSRV = 'type=SQLSRV:integratedlogin=1:srvname=l3mcts01s:dbname=Verite'
let g:dbext_default_profile                   = 'mySQLServerSQLSRV'
let g:dbext_default_use_win32_filenames       = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/dbext.vim'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/tComment'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'junegunn/vim-easy-align'
Plugin 'jbryer/sqlutils' "get rid of this
Plugin 'vim-scripts/SQLUtilities' "This helps to format sql queries nicely
Plugin 'jezcope/vim-align'
Plugin 'vim-scripts/DrawIt'
Plugin 'stardiviner/AutoSQLUpperCase.vim'
Plugin 'easymotion/vim-easymotion'
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

let g:airline#extensions#tabline#enabled = 1

"Easy Align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Map colon to semicolon
:nmap ; :

vmap <silent>sf        <Plug>SQLU_Formatter<CR>
nmap <silent>scl       <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd       <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt      <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp       <Plug>SQLU_CreateProcedure<CR>

"We want to format the SQL and run the statement at the same time
vmap <Leader>se <Leader>sfs<CR><Leader>se

"This will allow us to reload vimrc script for the current file:
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Let's easily open vimrc:
nmap <silent> <leader>vimrc :e $MYVIMRC<CR>

"Go to normal mode if you hit i twice
imap ii <Esc>

"not sure yet whether this works, it's supposed to switch tabs
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>

"Uncomment this to get the colors working in ConEmu
" set term=xterm
" set t_Co=256
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm

"search case insensitive
:set ignorecase!
