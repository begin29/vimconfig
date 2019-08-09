func Backspace()
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  else
    return "\<Left>\<Del>"
  endif
endfunc

set encoding=utf-8
set autowriteall

"set env variables from bashrc and zshrc
set shellcmdflag=-ic

"folding
set foldmethod=indent
set foldlevelstart=99 "open unfolded

set clipboard=unnamed
set number
set ruler
set nocursorline

"stop blinking cursor
set guicursor+=a:blinkon0

"update git gutter time
set updatetime=100

"set swap files directory
set directory=$HOME/.vim/swapfiles//
set undodir=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/swapfiles//

let g:indentLine_enabled = 1

nnoremap <C-p> :Files<Cr>
"copy filename with path
nmap <silent> ,cl :let @*=expand("%:p")<CR>
"copy only filename
nmap <silent> ,cs :let @*=expand("%")<CR>

"clear search highlight
nnoremap <silent> ,<space> :nohlsearch<CR>

set wildignore+=*/tmp/cache/*,.git/*,*.DS_Store,*/node_modules/*,*/tmp/ruby/*

if (has("gui_macvim"))
  "
else
  set term=xterm-256color
endif
"filetype plugin indent on

"disable autohide quotes in json files
set conceallevel=0

if (has("termguicolors"))
 set termguicolors
endif
syntax on
filetype on
filetype indent on
filetype plugin on

call plug#begin('~/.vim/plugged')
  "https://www.sitepoint.com/effective-rails-development-vim/
  Plug 'tpope/vim-rails'
  "snipmate
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'ludovicchabant/vim-gutentags'
  Plug 'leafgarland/typescript-vim'
  Plug 'mhartington/oceanic-next'
  Plug 'kchmck/vim-coffee-script'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Yggdroot/indentLine'
  Plug 'slim-template/vim-slim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'airblade/vim-gitgutter'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ErichDonGubler/vim-sublime-monokai'
  Plug 'pangloss/vim-javascript'
  Plug 'crusoexia/vim-javascript-lib'
  Plug 'ycm-core/YouCompleteMe'
  Plug 'joukevandermaas/vim-ember-hbs'
call plug#end()

"ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
"let g:ycm_auto_trigger=0
"set completeopt-=preview
"set completeopt-=menuone

"tree plugin style
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_altv = 1

"keymap
set keymap=ukrainian-enhanced
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set backspace=2

inoremap <BS> <c-r>=Backspace()<CR>
set tabstop=2
set shiftwidth=2
set expandtab

"show status line with file name and full path
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%F\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=%=                           " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

set autochdir

set splitbelow
set splitright
map <C-a> <esc>ggVG<CR>
"au FocusLost * :wa

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \
autocmd BufWritePre * %s/\s\+$//e

set tags=tags;/
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1

"increase tab in full height
noremap <F3> <C-W>_

"colorscheme PaperColor
"colorscheme torte

"let g:airline_theme='one'
"color happy_hacking
set hlsearch
"let g:airline_theme='one'
"
let g:sublimemonokai_term_italic = 1
colorscheme sublimemonokai "OceanicNext

"previous colorscheme
"colorscheme github

"colorscheme carbonized-light
"colorscheme carbonized-dark
"colo two-firewatch
"set background=dark
"set background=light
"colorscheme github

"underline Search instead of highlight
"hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline

"autocompletion menu's color
"hi PmenuSel  guifg=NONE guibg=blue gui=NONE
""hi Pmenu  guifg=#ffdd00 guibg=NONE gui=NONE
"hi Pmenu ctermfg=15 ctermbg=0 guifg=#ffdd00 guibg=#000000

hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

"set font
:set guifont=Source\ Code\ Pro\ for\ Powerline:h12

"remove scrollbars (macvim)
set guioptions=

"set text color for status line
hi StatusLineNC guibg=grey
hi StatusLine guibg=white

"TODO: ability to quick enable/disable
"set spell spelllang=en_us
"hi clear SpellBad
"hi SpellBad cterm=underline ctermfg=grey
"hi SpellCap cterm=underline ctermfg=grey
"hi SpellRare cterm=underline ctermfg=grey