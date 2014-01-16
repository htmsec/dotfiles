set nocompatible              " be iMproved
syntax on                     " syntax highlighing
filetype plugin indent on     " required! for Vundle
set modifiable

"====================================================================
"                              Vundle
"====================================================================

filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
if exists('*vundle#rc()')
  Bundle 'gmarik/vundle'
  " " Brief help
  " :BundleList          - list configured bundles
  " :BundleInstall(!)    - install(update) bundles
  " :BundleSearch(!) foo - search(or refresh cache first) for foo
  " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

  " vim-scripts repos
  Bundle 'L9'
  Bundle 'FuzzyFinder'
  Bundle 'The-NERD-tree'
  Bundle 'AutoComplPop'
  Bundle 'tComment'
  " original repos on github
  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'tomtom/tlib_vim'
  Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  Bundle 'sjl/gundo.vim'
  Bundle 'alfredodeza/pytest.vim'
  Bundle 'tsaleh/vim-matchit'
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
  Bundle 'mileszs/ack.vim'
  "    Align text
  Bundle 'godlygeek/tabular.git'
  "    Syntax highlighting for markdown files
  Bundle 'plasticboy/vim-markdown'
  "    Syntax highlighting for salt files
  Bundle 'saltstack/salt-vim'
  "    Interface with git from vim
  Bundle 'tpope/vim-fugitive'
  "    Syntax highlighting for git config files
  Bundle 'tpope/vim-git'
  "    Allows you to surround text with open/close tags
  Bundle 'tpope/vim-surround'
  "    :Unlink: Delete a buffer and the file on disk simultaneously.
  "    :Remove: Like :Unlink, but doesn't require a neckbeard.
  "    :Move: Rename a buffer and the file on disk simultaneously.
  "    :Chmod: Change the permissions of the current file.
  "    :Find: Run find and load the results into the quickfix list.
  "    :Locate: Run locate and load the results into the quickfix list.
  "    :SudoWrite: Write a privileged file with sudo.
  "    :W: Write every open window. Handy for kicking off tools like guard.
  Bundle 'tpope/vim-eunuch.git'
  Bundle 'tpope/vim-repeat'

  "     Optional
  Bundle 'klen/python-mode'
  Bundle 'gerw/vim-HiLinkTrace.git'
  "     Allows easy search and opening of files within a given path
  " Bundle 'wincent/Command-T' " requires ruby support!
endif

filetype on                   " try to detect filetypes
let mapleader=","             " change the leader to be a comma vs slash

"================================================================================
                                "Basic Settings
"================================================================================

set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set colorcolumn=81

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
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " s:how the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
" set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
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
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " always show status line
set vb t_vb=                " Disable all bells
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " Commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
" set listchars=tab:>-,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
" set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
set hidden                  " hide buffer when moving to diff one: LycosaExplorer
set clipboard=unnamed,unnamedplus " More sensible copy/paste setting

" Disable backup and swap files -- they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
set mouse=a                 " enable mouse
colorscheme modslate        " custom colorscheme

"===============================================================================
                               "Plugin Shortcuts
"===============================================================================

" Syntastic configurations use :help syntastic.txt
let g:syntastic_check_on_open=1 " check for errors when file is loaded
let g:syntastic_loc_list_height=5 " the height of the error list defaults to 10
let g:syntastic_python_checkers = ['flake8'] " sets flake8 as the default
let g:syntastic_javascript_checkers = ['jshint'] " sets jshint as our javascript linter

" Ignore line width for syntax checking in python
let g:syntastic_python_flake8_post_args='--ignore=E501'
let g:syntastic_filetype_map = { 'handlebars.html': 'handlebars' }

" Open NerdTree
map <leader>nn :NERDTreeToggle<CR>

" Toggle the Gundo window
map <leader>gg :GundoToggle<CR>

" Run FuzzyFinder file search
noremap <leader>ff :FufFile<CR>

" Run LycosaExplorer search
noremap <leader>df :LycosaFilesystemExplorer<CR>
noremap <leader>fb :LycosaBufferExplorer<CR>
noremap <leader>fh :LycosaFilesystemExplorerFromHere<CR>

" Ack searching!
nmap <leader>a <Esc>:Ack!<space>

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

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1

" map vim-sneak to f instead to s
let g:sneak#streak = 1
nmap f <Plug>SneakForward
xmap f <Plug>VSneakForward
nmap F <Plug>SneakBackward
xmap F <Plug>VSneakBackward
nmap 0 <Plug>SneakNext
" \ maps to SneakPrevious by default

" disable folding in markdown files
let g:vim_markdown_folding_disabled=1

" for when we forget to use SUdo to open/edit a file -- force sudo write
map <leader>sw :SudoWrite<CR>

" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

"===============================================================================
                                  "Shortcuts
"===============================================================================
" Commands                        Mode
" --------                        ----
" nmap, nnoremap, nunmap          Normal mode
" imap, inoremap, iunmap          Insert and Replace mode
" vmap, vnoremap, vunmap          Visual and Select mode
" xmap, xnoremap, xunmap          Visual mode
" smap, snoremap, sunmap          Select mode
" cmap, cnoremap, cunmap          Command-line mode
" omap, onoremap, ounmap          Operator pending mode

" list buffers
noremap <leader>ll :ls<CR>

nnoremap ; :

" Insert ipdb breakpoint in python file
map <leader>B Oimport ipdb; ipdb.set_trace() # BREAKPOINT<CR>

" refresh this (current) file buffer
nnoremap <leader>bb :bufdo e!<CR>

" easier moving of code blocks in visual mode
vnoremap < <gv
vnoremap > >gv

" Copy(yank) and Paste from/to clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" Quit and Write
nnoremap <leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" buffer listing and switching
nnoremap <F5> :buffers<CR>:buffer<Space>
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" hide matches on <leader>space
nnoremap <leader><space><space> :nohlsearch<cr>
nnoremap <leader><space> :set hlsearch<cr>
nohlsearch  " do not highlight text searches by default

" Reload Vimrc
map <silent> <leader>v :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Open Vimrc for editing
map <silent> <leader>V :e $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc file opened for editing'"<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Open new tab
map <leader>tt :tabnew<CR>

" Switching to other tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt

" Show AutoComplete options
let g:acp_completeoptPreview=1
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" display hex codes of the format #ffffff or #fff
if exists('*HexHighlight()')
  nmap <leader>h :call HexHighlight()<Return>
endif

"===============================================================================
                                   "Commands
"===============================================================================
"The new :Shell command works just like :! except that it opens a Vim scratch
"buffer and prints the command output there. - from vim.wikia.com
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction
map <leader>! :Shell<space>

" Redirect ex command output to new tab - from vim.wikia.com
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  tabnew
  silent put=message
  set nomodified
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
map <leader>re :TabMessage<space>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nnoremap <leader>W :call <SID>StripTrailingWhitespaces()<CR>

"===============================================================================
                          "FileType Specific Changes
"===============================================================================
" Set default filetype to python
autocmd BufEnter set filetype detect
let g:do_filetype = 0
autocmd BufEnter,BufAdd * if expand('<afile>') == "" | let g:do_filetype = 1 | endif
autocmd BufEnter * if g:do_filetype | setf python | let g:do_filetype = 0 | endif

" Use this to center titles in this document
" nnoremap <leader>00 @=(80-strlen('Hello World')-2)/2<CR>i-<ESC>y^"<Esc>A<space>Hello World<space><Esc>"0p<Esc>I"<Esc>o<Esc>

autocmd BufEnter *.vimrc,*.conf,*.ini setfiletype vim

"------------------------------------- Web -------------------------------------
autocmd BufEnter *.json,*jshintrc setfiletype javascript
autocmd BufEnter *.scss setfiletype scss
autocmd BufEnter *.less setfiletype less
autocmd BufEnter *.html,*.htm setfiletype html
autocmd FileType css,scss,less set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,jinja set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html,xhtml,xml,css,scss,less setlocal expandtab smarttab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2,*.jinja setlocal ft=html

"---------------------------------- Javascript ----------------------------------
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufRead *.js set makeprg=jslint\ %

"------------------------------------ Python ------------------------------------
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd BufRead *.py compiler nose
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

"===============================================================================
                             "Virtual Env Settings
"===============================================================================

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
