call plug#begin()


function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree' 
Plug 'rdnetto/YCM-Generator'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()


" Auto start nerdtree
autocmd vimenter * NERDTree

" Close vim if only remaining window is NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let mapleader=","

set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set smartcase
set hlsearch
set incsearch
set noshowmatch

set backspace=indent,eol,start


set title
set visualbell
set noerrorbells

set nobackup
set noswapfile

set nowrap

map <tab><tab> :tabnext<CR>
map <S-tab><S-tab> :tabprev<CR>

set enc=utf-8
syntax on

set foldmethod=indent

" http://www.make-believe.org/in-words/post/vim-is-forever/
map <F5> <C-w><C-w>
map <C-w><C-t> :WMToggle<CR>
map <F12> \be
map <C-c> :Kwbd<CR>

:noremap <C-left> :tabnext<CR>
:noremap <C-right> :tabprev<CR>

" Cleanup extra spacing
map <BackSpace><BackSpace> :mark I<cr>:%s/\ *$//<cr>:noh<cr>:'I<cr>

" Cleanup search highlights
nnoremap <Space> :noh <CR><CR>

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype indent on     " enables filetype indent detection

" highlight extra long lines
" highlight extraspacing after end of line
highlight OverLength ctermbg=grey ctermfg=black guibg=#592929
highlight ExtraSpacing ctermbg=black ctermfg=black guibg=#592929
match OverLength /\%81v.\+/
match ExtraSpacing /\ \+$/

" set column number 80 to black
""set colorcolumn=80
:highlight ColorColumn ctermbg=black guibg=lightgrey

" This line is a last worked line bookmark for newly opened file
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline_powerline_fonts=1
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
let g:airline_linecolumn_prefix = '¶ '
let g:airline_branch_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_paste_symbol = 'Þ'
let g:airline_paste_symbol = '∥'
let g:airline_section_c = '%{getcwd()}/%t'


set bg=dark
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

" Focus to main text instead of NerdTree
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif


" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:␣
noremap <F4> :set list!<CR>
inoremap <F4> <C-o>:set list!<CR>
cnoremap <F4> <C-c>:set list!<CR>

" gofmt won't cloae folds https://github.com/fatih/vim-go/issues/502 
let g:go_fmt_experimental = 1
