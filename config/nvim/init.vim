if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

let g:python3_host_prog = '~/.asdf/shims/python3'

call plug#begin('~/.config/nvim/plugged')

Plug 'Vermonster/vim-fsh'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'mileszs/ack.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'jlanzarotta/bufexplorer'
Plug 'pangloss/vim-javascript'
Plug 'sjl/gundo.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'duskhacker/sweet-rspec-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'scrooloose/nerdcommenter'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'vim-airline/vim-airline'
Plug 'hashivim/vim-terraform'
Plug 'digitaltoad/vim-pug'
Plug 'mxw/vim-jsx'
Plug 'jceb/vim-orgmode'
Plug 'dylon/vim-antlr'
Plug 'mustache/vim-mustache-handlebars'
Plug 'leafgarland/typescript-vim'
Plug 'udalov/kotlin-vim'
Plug 'valloric/youcompleteme'
Plug 'aklt/plantuml-syntax'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'leafgarland/typescript-vim'

let g:vim_vue_plugin_use_typescript = 1
let g:vim_vue_plugin_highlight_vue_attr = 1

let g:ycm_autoclose_preview_window_after_completion = 1
nnoremap <leader>jd :YcmCompleter GoTo<CR>

call plug#end()

" themes / colors
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

" change the mapleader from \ to ,
let mapleader=","

" no error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


nnoremap <leader>sc :set spell!<CR>
nnoremap <leader>hs :set hls!<CR>

" statusline:
set laststatus=2

" Basic tab behavior
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set number

" diable bell in vim
:set vb t_vb=

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
" File types
au BufRead,BufNewFile Vagrantfile,Berksfile,Gemfile setfiletype ruby
au BufRead,BufNewFile *.es6 setfiletype javascript
au BufRead,BufNewFile *.map set syntax=javascript

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType crontab setlocal bck=yes

" Avoid esc insert mode
imap jj <esc>

" Tab completion
set wildmode=longest:list,full
set wildmenu
set complete=.,w,t
