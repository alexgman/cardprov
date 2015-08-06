" Always wrap long lines:
set ignorecase!
set wrap
set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin on
let mapleader = ','

syntax on

" ==== colorscheme ====
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
" =====================

filetype plugin indent on
source H:\connectionstrings.vim
let g:dbext_default_profile                   = 'Verite_db_Prod'
let g:dbext_default_use_win32_filenames       = 1

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'vim-scripts/dbext.vim'
  Plugin 'tpope/vim-surround.git'
  Plugin 'tpope/vim-repeat.git'
  Plugin 'git://github.com/altercation/vim-colors-solarized.git'
  Plugin 'fholgado/minibufexpl.vim'
  Plugin 'vim-scripts/tComment'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-fugitive' "awesome GIT library
  Plugin 'tpope/vim-abolish'
  Plugin 'junegunn/vim-easy-align'
  Plugin 'vim-scripts/SQLUtilities' "This helps to format sql queries nicely
  Plugin 'jezcope/vim-align'
  Plugin 'vim-scripts/DrawIt'
  Plugin 'tpope/vim-dispatch'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'Raimondi/delimitMate' "adds closings to quotes, brackets etc
  Plugin 'godlygeek/tabular'
  Plugin 'chrisbra/csv.vim' 
  Plugin 'dhruvasagar/vim-table-mode'
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

"Easy Align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"Map colon to semicolon
nmap ; :

vmap <silent>sf        <Plug>SQLU_Formatter<CR>
nmap <silent>scl       <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd       <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt      <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp       <Plug>SQLU_CreateProcedure<CR>

"We want to format the SQL and run the statement at the same time
"vmap <Leader>se <Leader>sfs<CR><Leader>se
""""""""had to get rid of this beecause formatting sucks

"This will allow us to reload vimrc script for the current file:
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"Let's easily open vimrc:
nmap <silent> <leader>vimrc :e $MYVIMRC<CR>

"Go to normal mode if you hit i twice
imap ii <Esc>

"not sure yet whether this works, it's supposed to switch tabs
"works great!
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>

"Uncomment this to get the colors working in ConEmu
" set term=xterm
" set t_Co=256
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm

"this is the left margin spacing
hi! link FoldColumn Normal
set foldcolumn=3 

"top margin spacing
"dont know how to do this yet:w

"amazing function, this helps to align text to the right within a visual block
function! RightAlignVisual() range
  let lim = [virtcol("'<"), virtcol("'>")]
  let [l, r] = [min(lim), max(lim)]
  exe "'<,'>" 's/\%'.l.'v.*\%<'.(r+1).'v./\=StrPadLeft(submatch(0),r-l+1)'
endfunction
function! StrPadLeft(s, w)
  let s = substitute(a:s, '^\s\+\|\s\+$', '', 'g')
  return repeat(' ', a:w - strwidth(s)) . s
endfunction

" Customization: (SQL Utilities plug in)
"     By default this script assumes a command is terminated by a ;
"     If you are using Microsoft SQL Server a command terminator 
"     would be "go", or perhaps "\ngo".
"     To permenantly override the terminator in your _vimrc file you can add
let g:sqlutil_cmd_terminator = "\ngo"

"turn off delimmate plugin temporarily

"replace tabs with spaces for sql dbext output:
""%s/\s\{2,}/\t/g

"let g:csv_delim='\^'
augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat	setfiletype csv
augroup END

" prettify sql: we dont really need this, just trying it out
vnoremap <Leader>rp :s/\<update\>\\|\<select\>\\|\<from\>\\|\<where>\\|\<left join\>\\|\<inner join\>\\|\<group by\>\\|\<order by\>/\r\U&/ge<cr><esc>
