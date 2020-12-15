func! Backspace()
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

"reload files after change branch
set autoread

"folding
set foldmethod=indent
set foldlevelstart=99 "open unfolded

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

nnoremap <C-p> :Files<Cr>
"copy filename with path
nmap <silent> ,cl :let @*=expand("%:p")<CR>
"copy only filename
nmap <silent> ,cs :let @*=expand("%")<CR>

"clear search highlight
nnoremap <silent> ,<space> :nohlsearch<CR>

set wildignore+=*/tmp/cache/*,.git/*,*.DS_Store,*/node_modules/*,*/tmp/ruby/*

if !executable('lsb_release')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
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

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

call plug#begin('~/.vim/plugged')
  "https://www.sitepoint.com/effective-rails-development-vim/
  " Plug 'tpope/vim-rails'

  Plug 'vim-scripts/todo-txt.vim'

  Plug 'MattesGroeger/vim-bookmarks'

  "snipmate
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'

  Plug 'tpope/vim-vinegar'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Yggdroot/indentLine'
  Plug 'terryma/vim-multiple-cursors'

  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  Plug 'dyng/ctrlsf.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow -g "!.git/*"'

  "fzf files command with additional options
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['-i']}, <bang>0)
  let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=tmp --exclude=bower_components'

  Plug 'chiedo/vim-case-convert'

  Plug 'mileszs/ack.vim'
  Plug 'stefandtw/quickfix-reflector.vim'

  Plug 'nanotech/jellybeans.vim'
  Plug 'morhetz/gruvbox'
  Plug 'altercation/vim-colors-solarized'
  Plug 'blueshirts/darcula'
  Plug 'ErichDonGubler/vim-sublime-monokai'
  Plug 'Rigellute/rigel'
  Plug 'mhartington/oceanic-next'
  Plug 'hzchirs/vim-material'
  Plug 'Lokaltog/vim-monotone'
  Plug 'kmszk/skyknight'
  Plug 'axvr/photon.vim'
  Plug 'smallwat3r/vim-efficient'
  Plug 'andreypopp/vim-colors-plain'

  " multiple syntax highlight
  Plug 'sheerun/vim-polyglot'

  Plug 'crusoexia/vim-javascript-lib'
  Plug 'ycm-core/YouCompleteMe'
call plug#end()

"space after comment sign #nerdcommenter
let g:NERDSpaceDelims = 1

"ultisnips settings
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"YouCompleteMe
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_key_list_stop_completion = [ '<C-y>' ]
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

" set tags=tags;/
" Generate ctags for current working directory
" temporary put satchel directory only
" TODO: look down to .git location as project folder
" TODO: it has not seen folder
" au BufWritePost * silent! !ctags $HOME/projects/satchel/show-app &

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
" colorscheme OceanicNext
"
colorscheme sublimemonokai
" colorscheme skyknight
" colorscheme gruvbox
" colorscheme jellybeans
"colorscheme carbonized-light
"colorscheme carbonized-dark

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

if g:colors_name == 'sublimemonokai'
  let g:sublimemonokai_term_italic = 1
endif

if g:colors_name == 'jellybeans'
  let g:jellybeans_use_term_italics = 1
  let g:jellybeans_use_lowcolor_black = 1
  " let g:jellybeans_overrides = {
  " \    'MatchParen': { 'guifg': 'dd0093', 'guibg': '000000',
  " \    'ctermfg': 'Magenta', 'ctermbg': '' },
   " \}
endif

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
command! -nargs=* GitBlame !git blame % -L <args>
command! -nargs=* GitLogHistory !git log --pretty=short -u -L <args>:%

command! -nargs=* TODOFind vimgrep /TODO/ **/*<args>

nmap     <C-f>f <Plug>CtrlSFPrompt

"insert current time/date
nnoremap <F5> "='('.strftime("%c").')'<CR>p

"TODO: ability to quick enable/disable
"set spell spelllang=en_us
"hi clear SpellBad
"hi SpellBad cterm=underline ctermfg=grey
"hi SpellCap cterm=underline ctermfg=grey
"hi SpellRare cterm=underline ctermfg=grey
