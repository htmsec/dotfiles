set nocompatible              " be iMproved
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " required! for Vundle | enable loading indent file for filetype
let mapleader=","             " change the leader to be a comma vs slash
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"
" ==========================================================
"             Basic Settings
" ==========================================================
"
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set colorcolumn=122           "

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack

" """ Insert completion
" " don't select first item, follow typing in autocomplete
" set completeopt=menuone,longest,preview
" set pumheight=6             " Keep a small completion window

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " s:how the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
" set nowrap                  " don't wrap text
" set linebreak               " don't wrap textin the middle of a word
" set autoindent              " always set autoindenting on
" set smartindent             " use smart indent if there is no indent file
set tabstop=2               " <tab> inserts 4 spaces 
set shiftwidth=2            " but an indent level is 2 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" " don't outdent hashes
" inoremap # #

" " close preview window automatically when we move around
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
" set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set listchars=tab:>-,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

" Display
if has("gui_running")
    colorscheme modslate
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T
else
    colorscheme modslate
endif
"
"====================================================================
"                              Vundle 
"====================================================================
"
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-git'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'wincent/Command-T'
Bundle 'sjl/gundo.vim'
Bundle 'alfredodeza/pytest.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'plasticboy/vim-markdown'
Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'honza/snipmate-snippets'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'pep8'
Bundle 'The-NERD-tree'
Bundle 'AutoComplPop'
Bundle 'tComment'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

" " Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" ==========================================================
"                     Plugin Shortcuts
" ==========================================================
"
" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Run FuzzyFinder file search
noremap <leader>ff :FufFile<CR>

" Run command-t file search
noremap <leader>f :CommandT<CR>

" Refresh command-t search path
noremap <leader>rr :CommandTFlush<CR>

" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>
"
" ==========================================================
"                     Shortcuts
" ==========================================================
"
filetype on                   " try to detect filetypes

" enable mouse
set mouse=a

" Copy(yank) and Paste from/to clipboard
nnoremap <leader>y "*y
nnoremap <leader>p "*p
nnoremap <leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Open new tab
map <leader>t :tabnew<CR>

" switching to other tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
