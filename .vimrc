syntax on

" INTERFACE SETTINGS
set showcmd
set hlsearch
set modeline
set ignorecase
set smartcase

set hidden         " Allow you to change buffers w/o saving or discarding changes
set wildmenu       " Enable a menu for quick changing menus.
set wildchar=<Tab>
set wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
map <F11> :Ex<CR>

" Remember last position
set viminfo='10,\"100,:20,%,n~/.viminfo

" Restore last position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set mouse=a

set shiftwidth=4
set softtabstop=4
set expandtab

map Y y$

set nocompatible
set backspace=2
map  <Esc>[7~ <Home>
map  <Esc>[8~ <End>

imap <Esc>[7~ <Home>
imap <Esc>[8~ <End>

