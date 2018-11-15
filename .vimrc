set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable

" Colors {{{
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
color solarized 
" }}}

"general{{{
scriptencoding utf-8
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set wildmenu                    " command matching
set cmdheight=2
set autoindent                  " Indent at the same level of the previous line

set number                  " Line numbers on
set relativenumber          " Relative number line

set showmatch               " Show matching brackets/parenthesis
set incsearch               " Find as you type search
set hlsearch                " Highlight search terms

set mouse=a                 " Automatically enable mouse usage
set laststatus=2            " Set Status line to always on
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set scrolloff=7                 " number of lines between cursor and screen edge
set history=2048                    " Store a ton of history (default is 20)
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-  
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows

set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

set expandtab                   " Tabs are spaces, not tabs
set shiftwidth=4                " Use indents of 4 spaces
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new hsplit below

set foldenable                  " enable folds
set foldmethod=marker           " Use markers for folds

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr      
"}}}

set noshowmode      " Already shown in lightline
let g:lightline={
            \ 'colorscheme': 'solarized',
            \  }

"{{{ files to ignore
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
" }}}

"Key mappings{{{
let mapleader = ','
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
inoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap <esc> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <right> <nop>
nnoremap dl 0D
nnoremap <leader>c I//<esc>
noremap <leader>p :set paste!<cr>
noremap <leader>r :set relativenumber!<cr>
inoremap { {}<left>

"}}}
" plugins

" NerdTree {{{
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        map <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        map <leader>nn :NERDTreeToggle<cr>
        nmap <leader>nt :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
        let g:NERDTreeWinPos = "left"
    endif
" }}}

" UndoTree {{{
    if isdirectory(expand("~/.vim/bundle/undotree/"))
        nnoremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
    endif
    if has("persistent_undo")
        set undodir=~/.vim/.undodir/
        set undofile
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif
" }}}

"syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=['pyflakes']
" }}}

" Gitgutter{{{
    let g:gitgutter_enabled=0
    nnoremap <silent> <leader>d :GitGutterToggle<cr>
" }}}

"bufexplorer{{{
    let g:bufExplorerDefaultHelp=0
    let g:bufExplorerShowRelativePath=1
    let g:bufExplorerFindActive=1
    let g:bufExplorerSortBy='name'
    noremap <leader>o :BufExplorer<cr>
    noremap <leader>v :BufExplorerVerticalSplit<cr>
" }}}

" Tagbar {{{
nnoremap <leader>tt :TagbarToggle<cr>
" }}}
