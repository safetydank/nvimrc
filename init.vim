call plug#begin('~/.local/share/nvim/plugged')
    Plug 'asvetliakov/vim-easymotion'
if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'vim-scripts/bufexplorer.zip'
    Plug 'tpope/vim-fugitive'
    Plug 'rking/ag.vim'
    Plug 'majutsushi/tagbar'
    Plug 'mhinz/vim-startify'
    Plug 'vim-scripts/Gundo'
endif
call plug#end()

" Quick set tabstop size with Tab
function! s:TabWidth(width)
    execute "set sts=" . a:width
    execute "set ts="  . a:width
    execute "set sw="  . a:width
endfunction
command! -nargs=1 Tab call s:TabWidth(<f-args>)

" use spaces for tabs
set expandtab
set hidden
set history=1000
set incsearch
set hlsearch
set laststatus=2
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ L%l,%c%V\ %P
set smartindent

" default to case-insensitive searches if input is lowercase
set ignorecase
set smartcase

" Emacs-style bindings in insert mode
inoremap <C-e> <End>
inoremap <C-a> <Home>

" Vim insert mode cursor bindings
inoremap <M-h> <Left>
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-l> <Right>

" Line navigation
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

set backspace=indent,eol,start
" no 0 indent on entering '#'
inoremap # X#

set wildmenu
set wildmode=list:longest

set diffexpr="diff"

" Use ; as a shortcut to :
nnoremap ; :

" sudo write a file
command! -nargs=0 Sudow !sudo tee % >/dev/null

if exists('g:vscode')
    " VSCode extension
else
    " toggle visual whitespace
    " set listchars=tab:>-,trail:·,eol:$
    set listchars=tab:>-,trail:-,eol:$
    nmap <silent> <leader>s :set list!<CR>

    " Navigate through quickfix
    nnoremap <silent> <M-q> :cw<CR>
    nnoremap <silent> <M-e> :cc<CR>
    nnoremap <silent> <C-n> :cn<CR>
    nnoremap <silent> <C-p> :cp<CR>
endif
"
" Strip leading and trailing whitespace
nnoremap <silent> <leader>w :%s/\v(^\s+$)\|(\s+$)//g<CR>

