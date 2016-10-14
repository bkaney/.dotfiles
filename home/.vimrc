set nocompatible               " be iMproved
filetype off                   " required!

" ---------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-cucumber'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
Plugin 'mileszs/ack.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'nono/vim-handlebars'
Plugin 'sjl/gundo.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'duskhacker/sweet-rspec-vim'
Plugin 'sukima/xmledit'
Plugin 'heartsentwined/vim-emblem'
Plugin 'kien/ctrlp.vim.git'
Plugin 'bkaney/vim-postcss-sorting'
call vundle#end()

" ---------------------------
" plugin config
let g:vim_json_syntax_conceal = 0
nnoremap <F5> :GundoToggle<CR>
nnoremap <Leader>ps :CSSSorting<CR>

map <leader>R :SweetVimRspecRunFile<CR>
map <leader>r :SweetVimRspecRunFocused<CR>

map <Leader>x :set filetype=xml<CR>
  \:source $VIMRUNTIME/syntax/xml.vim<CR>
  \:set foldmethod=syntax<CR>
  \:source $VIMRUNTIME/syntax/syntax.vim<CR>

" ---------------------------
" config
syntax on
filetype plugin indent on
let mapleader = ","
set wrap
set number
set history=1000
set backspace=indent,eol,start

let g:vim_json_syntax_conceal = 0
nnoremap <F5> :GundoToggle<CR>
map <leader>R :SweetVimRspecRunFile<CR>
map <leader>r :SweetVimRspecRunFocused<CR>

map <Leader>x :set filetype=xml<CR>
  \:source $VIMRUNTIME/syntax/xml.vim<CR>
  \:set foldmethod=syntax<CR>
  \:source $VIMRUNTIME/syntax/syntax.vim<CR>

autocmd FileChangedShell * echo "File changed, press F9 to reload."

autocmd CursorHold * call Timer()
function! Timer()
    call feedkeys("f\e")
    checktime
endfunction
set updatetime=1000  " milliseconds

autocmd CursorHoldI * call TimerI()
function! TimerI()
    call feedkeys("\<C-R>\e")
    checktime
endfunction

" Basic tab behavior
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" no error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" themes / colors
set term=xterm-256color
set background=dark
colorscheme solarized

nnoremap <leader>sc :set spell!<CR>
nnoremap <leader>hs :set hls!<CR>

" statusline:
set laststatus=2

" diable bell in vim
:set vb t_vb=

" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
set statusline=%{fugitive#statusline()}
set statusline+=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" ---------------------------
" Backup

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set backupskip=/tmp/*,/private/tmp/*


" ----------------------------
" File mutations

match ErrorMsg '\s\+$'

" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" ----------------------------
" Tab completion
set wildmode=list:longest,list:full
set complete=.,w,t

" ----------------------------
" File types

au BufRead,BufNewFile Vagrantfile,Berksfile,Gemfile,Hanfile setfiletype ruby
au BufRead,BufNewFile *.es6 setfiletype javascript
