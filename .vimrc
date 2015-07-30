if has("syntax")
	syntax on
endif

set nocompatible
filetype off
syntax on

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'itchyny/lightline.vim'
Plug 'Valloric/YouCompleteMe'
"Plug 'w0ng/vim-hybrid'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'tpope/vim-fugitive'
call plug#end()

filetype plugin indent on
set modelines=0

" Turns on line numbers "
set number
set laststatus=2
set t_Co=256
set encoding=utf-8

" Select theme
colorscheme PaperColor

" Folds
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set foldnestmax=1

" My default indentation settings "
set tabstop=8
set shiftwidth=8
set softtabstop=8
set noexpandtab
set cindent
set autoindent
set smartindent

""TURNS OFF F1 AS HELP KEY"""""
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" No annoying sound on errors:  "
set noerrorbells

" No annoying visual errors either "
set novisualbell

" Wraps words that are too long
" Want word wrapping, but only want line breaks inserted when you explicitly press the Enter key:
set wrap
set linebreak
set nolist

" Searching"
set ignorecase  "case insensitive

" Sets F3 to cancel the highlighting "
nnoremap <F3> :set hlsearch!<CR>

" Do smart case matching
set smartcase

" Sets the paste togle button to F2
set pastetoggle=<F2>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Automatically remove trailing white space
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif


" --- Lightline settings ---
let g:lightline = {
			\ 'colorscheme': 'Tomorrow',
			\ 'active': {
			\   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
			\ },
			\ 'component': {
			\   'readonly': '%{&readonly?"⭤":""}',
			\ },
			\ 'component_function': {
			\   'ctrlpmark': 'CtrlPMark',
			\ },
			\ 'component_expand': {
			\   'syntastic': 'SyntasticStatuslineFlag',
			\ },
			\ 'component_type': {
			\   'syntastic': 'error',
			\ }
			\ }

augroup AutoSyntastic
	autocmd!
	autocmd BufWritePost * call s:syntastic()
augroup END
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction

" Allow syntastic to jump between different errors
let g:syntastic_python_python_exec = '/usr/bin/python2.7'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_style_warning_symbol="⚑"
let g:syntastic_style_error_symbol="⚑"
let g:syntastc_enable_signs=1
highlight SyntasticErrorSign ctermfg=161 ctermbg=255
highlight SyntasticWarningSign ctermfg=220 ctermbg=255
hi SpellBad ctermfg=040 ctermbg=255 guifg=#707880 guibg=#303030
hi SpellCap ctermfg=057 ctermbg=255 guifg=#707880 guibg=#303030
highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap

" Turn off the start up message
set shortmess+=I

" Turn off recording mode
"nnoremap q <nop>

" Hide the default mode text before the statusline
set noshowmode

" Change the : into ; so you don't have to press shift
nnoremap ; :

" Allows me to do :Q! as well as :q
command -bang Q quit<bang>

" Change the backspace so it acts as it should
set backspace=eol,start,indent
set ft=c
set fo+=c
set tw=60

" Set Java file type properties:
autocmd Filetype java setlocal ts=4 sts=4 sw=4 noexpandtab

" Set cpp type properties:
autocmd Filetype cpp setlocal ts=8 sts=8 sw=8

" Set python file type properties:
autocmd Filetype python setlocal ts=4 sts=4 sw=4 textwidth=80 smarttab expandtab smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Set c file type properties:
autocmd Filetype c setlocal ts=8 sts=8 sw=8 textwidth=80 smarttab noexpandtab

" No Swap files
set noswapfile

let g:ycm_global_ycm_extra_conf = '/home/ep/.ycm_extra_conf.py'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/bin/python2.7'
let g:ycm_confirm_extra_conf = 0

" Mouse settings
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Function to pull lines from other files
function! s:GetFromFile(...)
	execute 'r! sed -n '. a:1 .','. a:2 .'p '. a:3
endf
command -nargs=+ -complete=file GetFromFile call s:GetFromFile(<f-args>)

let g:loaded_matchparen=0

set lazyredraw
set ttyfast
"set cursorline

" Easier Split Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Follow the leader
let mapleader = "\<Space>"

nnoremap <Leader>o :CtrlP /home/fenriz/<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :Gstatus<CR>
nnoremap <Leader>c :Gcommit<CR>
nnoremap <Leader>h :Gpush<CR>
nnoremap <Leader>a :Gwrite<CR>
nnoremap <Leader>l :ll<CR>
nnoremap <Leader>v :PlugUpdate<CR>

" Copy & paste to & from system clipboard with <Space>y &
" <Space>p (must compile vim with +xclipboard)
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Automatically jump to the end of the text you pasted:
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Go to line number without having to shift+g
nnoremap <CR> G
nnoremap <BS> gg


" Tells ctrlp to persist the cache in the location
" so it will read from there and load the cache
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"
" Let CtrlP show hidden files:
let g:ctrlp_show_hidden = 1

" Do not clear the cache on exit please and thank you
let g:ctrlp_clear_cache_on_exit=0

let g:ctrlp_mruf_max=100

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(aptitude|cache|compiled|dbus|fonts|frozenwasteland|gconf|gimp-2.8|gnome|gnupg|gstreamer-0.10|local|lyrics|mozilla|oh-my-zsh|pki|PlayOnLinux|puddletag|qws|ssh|steam|terminfo|thumbnails|wine)$'


""" Uses <Leader>u for commenting blocks of code
nnoremap <Leader>u :<c-u>.,.+<c-r>=v:count<cr>call <SID>toggleComment()<cr>
nnoremap <Leader>u :<c-u>set opfunc=<SID>commentOp<cr>g@
xnoremap <Leader>u :call <SID>toggleComment()<cr>

function! s:commentOp(...)
  '[,']call s:toggleComment()
endfunction

function! s:toggleComment() range
  let comment = substitute(get(b:, 'commentstring', &commentstring), '\s*\(%s\)\s*', '%s', '')
  let pattern = '\V' . printf(escape(comment, '\'), '\(\s\{-}\)\s\(\S\.\{-}\)\s\=')
  let replace = '\1\2'
  if getline('.') !~ pattern
    let indent = matchstr(getline('.'), '^\s*')
    let pattern = '^' . indent . '\zs\(\s*\)\(\S.*\)'
    let replace = printf(comment, '\1 \2' . (comment =~ '%s$' ? '' : ' '))
  endif
  for lnum in range(a:firstline, a:lastline)
    call setline(lnum, substitute(getline(lnum), pattern, replace, ''))
  endfor
endfunction
"""

" Make the switch from modes have no delay
set ttimeoutlen=0
