
" SETTINGS FROM:
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugin Area
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Enable folding
set foldmethod=indent
set foldlevel=99
" docstrings for folded code %#%
let g:SimpylFold_docstring_preview=1


" PYTHON INDENTATION
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix


" FLAGGING UNNECESSARY WHITESPACE
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF8 SUPPORT
set encoding=utf-8

" AUTO-COMPLETE
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" SYNTAX CHECKING/HIGHLIGHTING
let python_highlight_all=1
syntax on

" COLOR SCHEMES
set background=dark
colorscheme solarized
highlight LineNr ctermfg=green

" FILE BROWSING
" let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" LINE NUMBERING
set number

" SYSTEM CLIPBOARD
set clipboard=unnamed


" FROM JAN
" Set to auto read when file is changed from the outside
set autoread
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Use Unix as the standard file type
set ffs=unix,dos,mac
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" Enable folding
set foldmethod=indent
set foldlevel=99
" Allow proper crontab-editing on macOS
au BufEnter /private/tmp/crontab.* setl backupcopy=yes
autocmd ColorScheme * highlight UnwanttedTab ctermbg=red guibg=darkred
autocmd ColorScheme * highlight TrailSpace guibg=red ctermbg=darkred


" KEY MAPPING

" Remove default arrow key mappings
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
no <up> <Nop>
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
vno <up> <Nop>
vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
" Map proper tabbing commands
map <C-n> :NERDTreeToggle<CR>
nmap <C-right> :tabnext<CR>
nmap <C-left> :tabprevious<CR>
map <C-right> :tabnext<CR>
map <C-left> :tabprevious<CR>
imap <C-right> <ESC>:tabprevious<CR>
imap <C-left> <ESC>:tabnext<CR>
" Enable split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding with the spacebar
nnoremap <space> za
" Enable changing the colormap using F5
call togglebg#map("<F7>")


