function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

call plug#begin('~/.vim/plugged')
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  let g:deoplete#enable_at_startup = 1

  "https://www.sitepoint.com/effective-rails-development-vim/
  "Ruby
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-bundler'
  Plug 'kana/vim-textobj-user'
  Plug 'nelstrom/vim-textobj-rubyblock'

  Plug 'vim-ruby/vim-ruby'
  "correct indent in ruby
  let g:ruby_indent_block_style = 'do'

  Plug 'aliou/sql-heredoc.vim'

  Plug 'lifepillar/pgsql.vim'
  let g:sql_type_default = 'pgsql'

  "open not writable file with sudo
  Plug 'lambdalisue/suda.vim'
  let g:suda_smart_edit = 1

  "create multiline with gj
  Plug 'AndrewRadev/splitjoin.vim'

  "usefull default settings
  Plug 'tpope/vim-sensible'

  "quickly wrap/surround text with quotes, brackets
  " https://vimawesome.com/plugin/surround-vim
  Plug 'tpope/vim-surround'

  "change mode, delete, rename file
  Plug 'tpope/vim-eunuch'

  "add end to functions
  Plug 'tpope/vim-endwise'

  "better replacement, correction and transform to cammel-case, snake case
  ":Subvert/di{e,ce}/spinner{,s}/g - replace
  "crs - transform word to snake_case
  "crc - to camelCase
  "correct wrongly written words
  ":iabbrev  seperate  separate
  Plug 'tpope/vim-abolish'

  "syntax highlight and mapping for markdown
  Plug 'plasticboy/vim-markdown'

  "quickly aligh paragraph
  "vipga= select paragraph and start easyAlign process(ga) by =
  Plug 'junegunn/vim-easy-align'

  "tab completion
  Plug 'ervandew/supertab'

  Plug 'vim-scripts/todo-txt.vim'

  Plug 'MattesGroeger/vim-bookmarks'

  "snipmate
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'

  Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_file_list_command = 'rg --files'

  "syntax highlight
  Plug 'tpope/vim-vinegar'

  "comment line/block
  Plug 'tpope/vim-commentary'

  Plug 'Yggdroot/indentLine'
  Plug 'terryma/vim-multiple-cursors'

  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'drzel/vim-repo-edit'

  " https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt
  Plug 'tpope/vim-unimpaired'

  Plug 'qpkorr/vim-bufkill'
  Plug 'Asheq/close-buffers.vim'

  Plug 'dyng/ctrlsf.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow -g "!.git"'

  "fzf files command with additional options
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['-i']}, <bang>0)

  let $BAT_THEME = 'Monokai Extended Origin'
  command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}),
  \ <bang>0)
  let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=tmp --exclude=bower_components'

  Plug 'chiedo/vim-case-convert'

  Plug 'mileszs/ack.vim'
  Plug 'stefandtw/quickfix-reflector.vim'

  Plug 'nanotech/jellybeans.vim'
  Plug 'morhetz/gruvbox'
  Plug 'altercation/vim-colors-solarized'
  Plug 'blueshirts/darcula'
  Plug 'ErichDonGubler/vim-sublime-monokai'
  Plug 'crusoexia/vim-monokai'
  Plug 'Rigellute/rigel'
  Plug 'mhartington/oceanic-next'
  Plug 'hzchirs/vim-material'
  Plug 'tomasr/molokai'
  Plug 'kmszk/skyknight'
  Plug 'smallwat3r/vim-efficient'
  Plug 'andreypopp/vim-colors-plain'

  " multiple syntax highlight
  Plug 'sheerun/vim-polyglot'

  Plug 'crusoexia/vim-javascript-lib'
call plug#end()

"ultisnips settings
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YouCompleteMe
 let g:ycm_key_list_previous_completion=['<Up>']
 let g:ycm_key_list_stop_completion = [ '<C-y>' ]
 let g:ycm_auto_hover=''
"show documentation
" nmap <leader>D <plug>(YCMHover)
"let g:ycm_auto_trigger=0
"set completeopt-=preview
"set completeopt-=menuone

"Netrw settings
let g:netrw_localrmdir='rm -r'
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 25
"let g:netrw_altv = 1

"keymap
set keymap=ukrainian-enhanced
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set encoding=utf-8
set autowriteall

"reload files after change branch
set autoread

set showbreak=↪\

"folding
set foldmethod=indent
set foldlevelstart=99 "open unfolded

"Ignore case when searching
set ignorecase
"Case sensitive if uppercase used like /The
set smartcase

"always show all characters on md, json files
set conceallevel=0

"keep undo history after closing file
if has('persistent_undo')
  set undofile
  set undodir=$HOME/.vim_undo
endif

"remove system bell
set visualbell t_vb=

set relativenumber
set nu rnu
set ruler
set cursorline
set linespace=2

"stop blinking cursor
set guicursor+=a:blinkon0

"update git gutter time
set updatetime=100

"set swap files directory
set directory=$HOME/.vim/swapfiles//
set undodir=$HOME/.vim/swapfiles//
set backupdir=$HOME/.vim/swapfiles//

" let g:indentLine_setColors = 0
let g:indentLine_char_list = ['¦', '┆', '┊']

" http://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
set lazyredraw

"open help on a new tab
cabbrev help tab help

nnoremap <C-b> :Buffers<CR>

nnoremap <C-p> :Files<Cr>
"copy filename with path
nmap <silent> ,cl :let @*=join([expand("%:p"), line(".")], ':')<CR>
"copy only filename
nmap <silent> ,cs :let @*=expand("%")<CR>

"clear search highlight
nnoremap <silent> ,<space> :nohlsearch<CR>

map <leader>F :Rg<space>

" rm current file from buffer
map <C-c> :BD<cr>

"toggle spell check
map <F6> :setlocal spell! spelllang=en_us<cr>

set wildignore+=*/tmp/cache/*,.git/*,*.DS_Store,*/node_modules/*,*/tmp/ruby/*

if !executable('lsb_release')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
  set term=xterm-256color
endif

"disable autohide quotes in json files
set conceallevel=0

if (has("termguicolors"))
 set termguicolors
endif
syntax on
filetype on
filetype indent on
filetype plugin on

set backspace=2

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
" Generate ctags for current working directory
" temporary put satchel directory only
" TODO: look down to .git location as project folder
" TODO: it has not seen folder
" au BufWritePost * silent! !ctags $HOME/projects/satchel/show-app &

nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_GainFocus_On_ToggleOpen = 1

"increase tab in full height
noremap <F3> <C-W>_

set hlsearch
" colorscheme PaperColor
" colorscheme torte
" color happy_hacking
" colorscheme OceanicNext
" colorscheme skyknight
" colorscheme gruvbox
" colorscheme jellybeans
" colorscheme carbonized-light
" colorscheme carbonized-dark

let g:monotone_color = [120, 100, 70] " Sets theme color to bright green
" let g:monotone_secondary_hue_offset = 200 " Offset secondary colors by 200 degrees
let g:monotone_emphasize_comments = 1 " Emphasize comments

"set cursor color
hi Cursor guifg=#193549 guibg=green gui=NONE
set background=dark

"underline Search instead of highlight
" hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=green guibg=NONE gui=underline,italic,bold

let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_auto_close = {
  \ "normal" : 0,
  \ "compact": 0
  \}
let g:ctrlsf_position = 'top'
let g:ctrlsf_auto_focus = {
  \ "at": "start"
  \ }
let g:ctrlsf_winsize = '30%'

"autocompletion menu's color
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

"set found words
set shortmess-=S

"set font
if !executable('lsb_release')
  set guifont=Source_Code_Pro:h12
else
  set guifont=Source\ Code\ Pro:h11
end

"remove scrollbars (macvim)
set guioptions=

" sublimemonokai
let g:sublimemonokai_term_italic = 1

" 'jellybeans'
let g:jellybeans_use_term_italics = 1
let g:jellybeans_use_lowcolor_black = 1
" let g:jellybeans_overrides = {
" \    'MatchParen': { 'guifg': 'dd0093', 'guibg': '000000',
" \    'ctermfg': 'Magenta', 'ctermbg': '' },
 " \}

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
" colorscheme monokai

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

"send last clipboard to port mapped to local computer
function! SendToClipboard(content)
  call system('nc -q0 localhost 2224', a:content)
endfunction

"I'm on linux machine (remote then)
if executable('lsb_release')
  "autocmd run after yand, delete
  augroup AfterYankDelete
    autocmd!
    autocmd TextYankPost * call SendToClipboard(@")
  augroup END
endif

"commands
command! -nargs=* TODOFind vimgrep /TODO/ **/*<args>

nmap <C-f>f <Plug>CtrlSFPrompt

"insert current time/date
nnoremap <F5> "='('.strftime("%c").')'<CR>p

"TODO: ability to quick enable/disable
"set spell spelllang=en_us
"hi clear SpellBad
"hi SpellBad cterm=underline ctermfg=grey
"hi SpellCap cterm=underline ctermfg=grey
"hi SpellRare cterm=underline ctermfg=grey
