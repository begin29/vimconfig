call plug#begin('~/.vim/plugged')
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  endif

  " easy use sessions
  Plug 'mhinz/vim-startify'

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

  Plug 'maralla/completor.vim'

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

  Plug 'tonchis/vim-to-github'

  " https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt
  Plug 'tpope/vim-unimpaired'

  Plug 'qpkorr/vim-bufkill'
  Plug 'Asheq/close-buffers.vim'

  Plug 'dyng/ctrlsf.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'chiedo/vim-case-convert'

  Plug 'mileszs/ack.vim'
  Plug 'stefandtw/quickfix-reflector.vim'

  Plug 'airblade/vim-rooter'

  Plug 'mhinz/vim-janah'
  Plug 'nanotech/jellybeans.vim'
  Plug 'morhetz/gruvbox'
  Plug 'lifepillar/vim-solarized8'
  Plug 'blueshirts/darcula'
  Plug 'altercation/vim-colors-solarized'
  Plug 'crusoexia/vim-monokai'
  Plug 'Rigellute/rigel'
  Plug 'mhartington/oceanic-next'
  Plug 'hzchirs/vim-material'
  Plug 'tomasr/molokai'
  Plug 'kmszk/skyknight'
  Plug 'smallwat3r/vim-efficient'
  Plug 'andreypopp/vim-colors-plain'
  Plug 'carakan/new-railscasts-theme'
  Plug 'jpo/vim-railscasts-theme'
  Plug 'bluz71/vim-nightfly-guicolors'
  Plug 'easymotion/vim-easymotion'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'patstockwell/vim-monokai-tasty'

  Plug 'flazz/vim-colorschemes'

  " multiple syntax highlight
  Plug 'sheerun/vim-polyglot'

  Plug 'crusoexia/vim-javascript-lib'
call plug#end()

"vim-rooter
  let g:rooter_patterns = ['.git', 'Makefile', 'Gemfile']
  let g:rooter_resolve_links = 1

"tonchis/vim-to-github
  "copy line to clipboard
  let g:to_github_clip_command = 'pbcopy'
  let g:to_github_clipboard = 1

"easyMotion
  map  <Leader>/ <Plug>(easymotion-sn)
  omap <Leader>/ <Plug>(easymotion-tn)
  " <Leader>f{char} to move to {char}
  map  <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)

  " s{char}{char} to move to {char}{char}
  nmap <Leader>s <Plug>(easymotion-overwin-f2)

  " Move to line
  map <Leader>L <Plug>(easymotion-bd-jk)
  nmap <Leader>L <Plug>(easymotion-overwin-line)

  " Move to word
  map  <Leader>w <Plug>(easymotion-bd-w)
  nmap <Leader>w <Plug>(easymotion-overwin-w)
  let g:EasyMotion_smartcase = 1

"fzf settings => BEGIN
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction

  let g:fzf_action = {
    \ 'ctrl-q': function('s:build_quickfix_list'),
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  let $FZF_DEFAULT_COMMAND = '/opt/homebrew/bin/rg --files --follow'

  "fzf files command with additional options
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '-i']}), <bang>0)

  command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline', '-i']}), <bang>0)

  function! s:RGFzf(query, fullscreen)
    let initial_command = 'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(a:query)
    let spec = {'options': ['--layout=reverse']}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  let $BAT_THEME = 'Monokai Extended Origin'
  " let $BAT_THEME = 'Solarized (light)'
  command! -bang -nargs=* Rg call s:RGFzf(<q-args>, <bang>0)

  let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=tmp --exclude=bower_components'

  noremap <C-p> :Files<Cr>
"fzf settings => END

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
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 25
"let g:netrw_altv = 1
"https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
function! NetrwRemoveRecursive()
  if &filetype ==# 'netrw'
    cnoremap <buffer> <CR> trash<CR>
    normal mu
    normal mf

    try
      normal mx
    catch
      echo "Canceled"
    endtry

    cunmap <buffer> <CR>
  endif
endfunction

function! NetrwMapping()
  nmap <buffer> <TAB> mf
  nmap <buffer> <S-TAB> mF
  nmap <buffer> <Leader><TAB> mu
  nmap <buffer> fe R
  nmap <buffer> fc mc
  nmap <buffer> fC mtmc
  nmap <buffer> fx mm
  nmap <buffer> fX mtmm
  nmap <buffer> ff %:w<CR>:buffer #<CR>
  nmap <buffer> f; mx

  nmap <buffer> FF :call NetrwRemoveRecursive()<CR>

  " bookmarks
  nmap <buffer> bb mb
  nmap <buffer> bd mB
  nmap <buffer> bl gb
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

" set transparency=5

"keymap
if !has('nvim')
  set keymap=ukrainian-enhanced
  set iminsert=0
  set imsearch=0
  highlight lCursor ctermbg=red guibg=red
  " highlight lCursor guifg=NONE guibg=Cyan
end

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
set linespace=3

"stop blinking cursor
set guicursor+=a:blinkon0

"update git gutter time
set updatetime=100

"set swap files directory
set directory=$HOME/.config/vimswapfiles//
set undodir=$HOME/.config/vimswapfiles//
set backupdir=$HOME/.config/vimswapfiles//

" let g:indentLine_setColors = 0
let g:indentLine_char_list = ['¦', '┆', '┊']

" http://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
set lazyredraw

"open help on a new tab
cabbrev help tab help

nnoremap <C-b> :Buffers<CR>

"copy filename with path
nmap <silent> ,cl :let @*=join([substitute(expand("%:p"), "^.*\/spec", "spec", ""), line(".")], ':')<CR>
"copy only filename
nmap <silent> ,cs :let @*=expand("%")<CR>

"clear search highlight
nnoremap <silent> ,<space> :nohlsearch<CR>

map <leader>F <Plug>CtrlSFPrompt -ignoredir "spec"<space>
map <leader>G <Plug>CtrlSFPrompt

" rm current file from buffer
map <C-c> :BD<cr>

"toggle spell check
map <F6> :setlocal spell! spelllang=en_us<cr>

nnoremap WA silent! wa<CR>

set wildignore+=*/tmp/cache/*,.git/*,*.DS_Store,*/node_modules/*,*/tmp/ruby/*

if !executable('lsb_release')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
  set term=xterm-256color
endif

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

" Removes trailing spaces
function! TrimWhiteSpace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction

" save buffers on focus lost
au FocusLost * :silent! wa

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \

" autocmd FileWritePre * call TrimWhiteSpace()
" autocmd FileAppendPre * call TrimWhiteSpace()
" autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

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

set hlsearch!

let g:monotone_color = [120, 100, 70] " Sets theme color to bright green
" let g:monotone_secondary_hue_offset = 200 " Offset secondary colors by 200 degrees
let g:monotone_emphasize_comments = 1 " Emphasize comments

"set cursor color
hi Cursor guifg=#193549 guibg=green gui=NONE
"set background=light
set background=dark

"underline Search instead of highlight
" hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=green guibg=NONE gui=underline,italic,bold

let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_auto_close = {
  \ "normal" : 0,
  \ "compact": 0
  \}
let g:ctrlsf_position = 'left'
let g:ctrlsf_winsize = '100'
let g:ctrlsf_auto_focus = {
  \ "at": "start"
  \ }
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_extra_root_markers = ['.git']
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules']

" run function after init search window
function! g:CtrlSFAfterMainWindowInit()
  setl wrap
endfunction

"autocompletion menu's color
hi Pmenu ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#64666d gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#204a87 gui=NONE

"set found words
set shortmess-=S

"set font
if !executable('lsb_release')
  set guifont=Source\ Code\ Pro:h13
  " set guifont=Source_Code_Pro:h12
  " set guifont=UbuntuMonoDerivativePowerline-Regular:h15
  " set guifont=Office\ Code\ Pro\ D:h13
else
  set guifont=Source\ Code\ Pro:h13
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
colorscheme monokai
" colorscheme solarized8_high

" colorscheme molokai

autocmd ColorScheme janah highlight Normal ctermbg=235
" colorscheme janah

let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox

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

"insert current time/date
nnoremap <F5> "='('.strftime("%c").')'<CR>p

"always show all characters on md, json files
set conceallevel=0

"TODO: ability to quick enable/disable
"set spell spelllang=en_us
"hi clear SpellBad
"hi SpellBad cterm=underline ctermfg=grey
"hi SpellCap cterm=underline ctermfg=grey
"hi SpellRare cterm=underline ctermfg=grey

"disable autohide quotes in json files
set conceallevel=0
