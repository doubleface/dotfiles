runtime bundle/pathogen/autoload/pathogen.vim

" GENERAL OPTIONS in addition to vim-sensible -------- {{{
filetype off
call pathogen#infect()
set nocompatible

set completeopt=longest,menuone,preview " set completion mode for <c-n> and <c-p>
set hlsearch                            " highlight search results
set ignorecase                          " ignore case by default in searches
set smartcase                           " do not ignore case when majuscules are used
set gdefault                            " use g option for regex replace by default
set wrap                                " wrap the text by default
set textwidth=99
set splitright
set splitbelow
set hidden                              " don't display buffers if they've been closed
set mouse=a                             " have the mouse enabled all the time
set visualbell                          "No sound on errors.
set tabstop=2                           " Tabulations
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolljump=5                        " Windows scrolling 5 lines with the cursor
set so=5                                " Set 5 lines to the curors - when moving vertical
set switchbuf=useopen,usetab,newtab
set clipboard=unnamed
set diffopt+=vertical

"Turn on Wild menu
set wildmode=full
set cmdheight=1                         "The commandbar is 1 high
if exists("&wildignorecase")
    set wildignorecase
endif

" others
set showmatch                           " show matching bracets
set list
" }}}

" SPECIAL VIM FILES ------------------------ {{{
if ! len(glob("$HOME/.vimtrashfiles/backupfiles/"))
    echomsg "backup files directory does not exist! : $HOME/.vimtrashfiles/backupfiles/"
endif
set backupdir=$HOME/.vimtrashfiles/backupfiles        " where do i keep those backup files
set writebackup
set backup
set directory=$HOME/.vimtrashfiles/swap "swap files
set noswapfile
if v:version >= 703
    set undofile                            " keep undo information in a file
    if ! len(glob("$HOME/.vimtrashfiles/undofiles/"))
        echomsg "Undo files directory does not exist! : $HOME/.vimtrashfiles/undofiles/"
    endif
    set undodir=$HOME/.vimtrashfiles/undofiles            " where do i keep those undo files
    set colorcolumn=100                     " change color of characters after this column
endif
" }}}

" COLORS AND FONTS ----------------------------- {{{
colorscheme sahara

"Omni menu colors
highlight Pmenu guibg=brown gui=bold
highlight PmenuSel guibg=black gui=bold

" Highlight current line in insert mode.
augroup cursorgroup
    autocmd!
    autocmd InsertLeave * se nocul
    autocmd InsertEnter * se cul
augroup END

" }}}

" MAPPINGS ----------------------------------------- {{{
let mapleader = "ù"
let g:mapleader = "ù"
map <leader>ed :e! $HOME/.vimrc<cr>
map <leader>sed :source $HOME/.vimrc<cr>
nmap <silent> - :Vex<cr>
nmap <silent> <leader>q <C-w>h:q<cr>
nmap gd :ALEGoToDefinition<cr>
nmap <leader>r :ALEFindReferences<cr>

" give to Y the same behavior as D
nnoremap Y y$

"removes trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Go to the end/beginning of the line in normal or visual mode.
" Last/First line on screen is not usefull to me.
nnoremap L $
vnoremap L $
nnoremap H ^
vnoremap H ^

" ESC is too far
inoremap jk <ESC>

" <C-]> is hard to reach on french keyboard
nmap <C-CR> <C-]>

" diff mappings
if &diff
    nnoremap <tab> ]c
    nnoremap <S-tab> ]c
endif

" toggle folding
nnoremap <space> za

" select the just pasted text
nnoremap <leader>v `[V`]

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" do not go to ex mode ever
nnoremap Q <nop>

" buffers
nnoremap <leader>b :ls<CR>:b<space>
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprevious<CR>
nnoremap <silent> <leader><tab> :b #<CR>

" ` is hard to reach and is always better than '
nnoremap ' `

" console.log abbreviation
imap cll console.log('', )<Esc>==f(la
vmap cll jkyocll<Esc>plllp

" }}}

" FILE SETTINGS ------------------------------- {{{
" html file settings ------------------------- {{{
augroup filetype_html
    autocmd!
    autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
augroup END
" }}}

" css file settings ------------------------- {{{
augroup filetype_css
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
augroup END
" }}}

" xml file settings ------------------------- {{{
augroup filetype_xml
    autocmd!
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END
" }}}

" Vimscript file settings ------------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevelstart=0
augroup END
" }}}

augroup filetype_javascript
    autocmd!
    au FileType javascript setl fen
augroup END
" }}}

" STATUSLINE AND TITLE STRING--------------------------- {{{
set statusline=CWD:\%r%{getcwd()}%h                                  " current working directory
set statusline+=\                                                    " space
set statusline+=%m%r%h%w                                             " file is modified, no modifiable etc
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']'}  " evaluation with encoding, file format and file type
set statusline+=\                                                    " space
set statusline+=%.100f                                                " Current file full path restricted to n chars
set statusline+=%=                                                   " spacer
set statusline+=%l/%L:%c                                             " line counts

set title
set titlestring=VIM:\ %-25.55F
set titlelen=140
set titleold=
" }}}

" PLUGINS -------------------------------------- {{{

" ALE
let g:ale_fixers = {
\   'javascript': ['eslint']
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Netrw
let g:netrw_winsize = 20
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_banner = 0

" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '~'

" Fugitive
let g:fugitive_git_executable = 'LANG=en git'
autocmd BufReadPost fugitive://* set bufhidden=delete

" }}}

source ~/.vimrc_perso
