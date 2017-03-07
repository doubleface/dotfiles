" GENERAL OPTIONS -------------------------- {{{
filetype off
call pathogen#infect()
set nocompatible

set showcmd                             " display incomplete commands
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
set tabstop=4                           " Tabulations
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolljump=5                        " Windows scrolling 5 lines with the cursor
set so=5                                " Set 5 lines to the curors - when moving vertical
set guioptions-=m                       " removes the menu bar
set guioptions-=T                       " removes toolbar
set switchbuf=useopen,usetab,newtab
set clipboard=unnamed

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
set background=dark
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
let maplocalleader = "="
let g:maplocalleader = "="
map <leader>ed :e! $HOME/.vimrc<cr>
map <leader>sed :source $HOME/.vimrc<cr>
nmap <silent> <leader>n :Vex<cr>
nmap <silent> <leader>q <C-w>h:q<cr>

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

" just to try it jj is not used a lot in insertion mode and <ESC> key is so far away...
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

" Show all open buffers and their status
nnoremap <silent> (q :cprevious<CR>
nnoremap <silent> )q :cnext<CR>
nnoremap <silent> (a :previous<CR>
nnoremap <silent> )a :next<CR>
nnoremap <silent> (A :first<CR>
nnoremap <silent> )A :last<CR>
nnoremap <silent> (t :tprevious<CR>
nnoremap <silent> )t :tnext<CR>
nnoremap <silent> (T :tfirst<CR>
nnoremap <silent> )T :tlast<CR>

" ` is hard to reach and is always better than '
nnoremap ' `

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

" }}}

" PLUGINS -------------------------------------- {{{
" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_checkers = ["eslint"]

" Netrw
let g:netrw_winsize = 20
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_banner = 0

" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '~'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
" enable/disable displaying buffers with a single tab. >
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'

" }}}

source ~/.vimrc_perso
