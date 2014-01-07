set nocompatible              " be iMproved
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " required! for Vundle | enable loading indent file for filetype
let mapleader=","             " change the leader to be a comma vs slash
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"
"====================================================================
"                              Vundle 
"====================================================================
"
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vim-flake8'
Bundle 'The-NERD-tree'
Bundle 'AutoComplPop'
Bundle 'tComment'

" original repos on github
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

"    Interface with git from vim
Bundle 'tpope/vim-fugitive'

"    Allows you to surround text with open/close tags
Bundle 'tpope/vim-surround'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

"     Allows easy search and opening of files within a given path
Bundle 'wincent/Command-T'

Bundle 'sjl/gundo.vim'
Bundle 'alfredodeza/pytest.vim'

"    Generic test runner that works with nose
Bundle 'reinh/vim-makegreen'

"     Configurable snippets to avoid re-typing common comands
Bundle 'garbas/vim-snipmate'

Bundle 'honza/vim-snippets'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'justinmk/vim-sneak'
Bundle 'davidhalter/jedi-vim'
Bundle 'vim-scripts/LycosaExplorer'
Bundle 'tpope/vim-repeat'

"    Syntax highlighting for markdown files
Bundle 'plasticboy/vim-markdown'

"    Syntax highlighting for salt files
Bundle 'saltstack/salt-vim'

"    Syntax highlighting for git config files
Bundle 'tpope/vim-git'


" Bundle 'JarrodCTaylor/vim-js2coffee'
" Bundle 'goldfeld/vim-seek'
" Bundle 'mileszs/ack'
" Bundle 'kien/tabman.vim'
" Bundle 'klen/python-mode'
" Bundle 'pep8'

" " Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
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
"set colorcolumn=122           "

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack

" Insert completion
" don't select first item, follow typing in autocomplete
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
    colorscheme torte
endif
"
" Syntastic configurations use :help syntastic.txt
let g:syntastic_check_on_open=1 " check for errors when file is loaded
let g:syntastic_loc_list_height=5 " the height of the error list defaults to 10
let g:syntastic_python_checkers = ['flake8'] " sets flake8 as the default
let g:syntastic_javascript_checkers = ['jshint'] " sets jshint as our javascript linter

" Ignore line width for syntax checking in python
let g:syntastic_python_flake8_post_args='--ignore=E501'
let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }
"
" ==========================================================
"                     Plugin Shortcuts
" ==========================================================
"
" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" " Run pep8
" let g:pep8_map='<leader>8'

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Run FuzzyFinder file search
noremap <leader>ff :FufFile<CR>

" Run command-t file search
noremap <leader>f :CommandT<CR>

" Refresh command-t search path
noremap <leader>rr :CommandTFlush<CR>

" Ack searching!
nmap <leader>a <Esc>:Ack!

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" Run django tests
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" run py.test's
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" --- Toggle Syntastic
nnoremap <Leader>ts :SyntasticToggleMode<CR>

" Do show syntastic warnings in the status line
let g:airline#extensions#syntastic#enabled = 1 

" map vim-sneak to f instead to s
let g:sneak#streak = 1
nmap f <Plug>SneakForward
xmap f <Plug>VSneakForward
nmap F <Plug>SneakBackward
xmap F <Plug>VSneakBackward

" Hack to restore s back to replace action
nmap s s
nmap S S

" disable folding in markdown files
let g:vim_markdown_folding_disabled=1

" " Vim-seek
" let g:SeekKey = 'f'
" let g:SeekBackKey = 'F'

"
" ==========================================================
"                     Shortcuts
" ==========================================================
"
filetype on  "try to detect filetypes

" More sensible copy/paste setting
set clipboard=unnamed,unnamedplus

" easier moving of code blocks in visual mode
vnoremap < <gv
vnoremap > >gv

" Disable backup and swap files -- they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Insert ipdb breakpoint in python file
map <leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" refresh this (current) file buffer
nnoremap <leader>B :bufdo e!<CR>

" enable mouse
set mouse=a

" Copy(yank) and Paste from/to clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" Quit and Write
nnoremap <leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Open Vimrc for editing
map <silent> <leader>E :e ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc file'"<CR>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" for when we forget to use sudo to open/edit a file -- force sudo write
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Open new tab
map <leader>t :tabnew<CR>

" Switching to other tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt

" Show AutoComplete options
let g:acp_completeoptPreview=1
"
" ===========================================================
" FileType specific changes
" ============================================================
"
" ------------------- Web
autocmd BufWinEnter *.json,*jshintrc setfiletype javascript
autocmd BufWinEnter *.scss setfiletype scss
autocmd BufWinEnter *.less setfiletype less
autocmd BufWinEnter *.html,*.htm setfiletype html
autocmd FileType css,scss,less set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,jinja set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal syntax=jinja
autocmd FileType html,xhtml,xml,css,scss,less setlocal expandtab smarttab tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType html,jinja runtime! macros/matchit.vim
autocmd BufWritePost *.scss,*.sass !compass compile ../ <afile> --force

" ------------------- Mako
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html

" ------------------- Javascript
au BufRead *.js set makeprg=jslint\ %

" ------------------- Python
" au FileType python set omnifunc=pythoncomplete#Complete
au BufRead *.py compiler nose
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" ------------------- Coffee Script
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
"
"
" ==========================================================
"                     Virtual Env Settings
" ==========================================================
"
" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif
