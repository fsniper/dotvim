execute pathogen#infect()
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

set title
set visualbell
set noerrorbells

set nobackup
set noswapfile

set nowrap

map <tab><tab> :tabnext<CR>
map <S-tab><S-tab> :tabprev<CR>

set enc=utf-8
set bg=dark
syntax on

set foldmethod=indent

" http://www.make-believe.org/in-words/post/vim-is-forever/
map <F5> <c-w><c-w>
map <c-w><c-t> :WMToggle<cr>
map <F12> \be
map <space> :noh<cr>
map <C-c> :Kwbd<cr>

:noremap <C-left> :bprev<CR>
:noremap <C-right> :bnext<CR>

" Cleanup extra spacing
map <BackSpace><BackSpace> :mark I<cr>:%s/\ *$//<cr>:noh<cr>:'I<cr>

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype indent on     " enables filetype indent detection

autocmd VimEnter * NERDTreeTabsToggle
autocmd VimEnter * wincmd p

:let g:buftabs_only_basename=1
:let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']

set laststatus=2
:let g:buftabs_in_statusline=1
:let g:buftabs_active_highlight_group="Visual"

" NO auto comment insertion for any filetype
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

map <C-o> :FufCoverageFile<CR>

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
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_paste_symbol = 'Þ'
let g:airline_paste_symbol = '∥'
let g:airline_section_c = '%{getcwd()}/%t'


" Supertab settings
" supertab + eclim == java win
let g:SuperTabDefaultCompletionTypeDiscovery = [
            \ "&completefunc:<c-x><c-u>",
            \ "&omnifunc:<c-x><c-o>",
            \ ]
let g:SuperTabLongestHighlight = 1
