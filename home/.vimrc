" APPEARANCE
syntax on
color slate

set showcmd        " Show the command line on the last line of screen.
set hlsearch       " Highlight search matches
set ignorecase
set smartcase
set ruler

" WILD MENU
set hidden         " Allow you to change buffers w/o saving or discarding changes
set wildmenu       " Enable a menu for quick changing menus.
set wildchar=<Tab>
set wildmode=full
set wildcharm=<C-Z>

" REMEMBER / RESTORE LAST POSITION
set viminfo='10,\"100,:20,%,n~/.viminfo

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
set laststatus=2
set confirm
set visualbell

" BEHAVIOR
set ttyfast " Redraw the screen very fast.  Makes vim more responsive feeling.
set mouse=a " Enable mouse for all modes

set modeline
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

autocmd FileType make setlocal noexpandtab

set nocompatible
set backspace=2

" KEYBINDINGS

map Y y$
" Ctrl-P will toggle paste mode.
set pastetoggle=<C-P>

" Bind Home/End keys to what I like
map  <Esc>[7~ <Home>
map  <Esc>[8~ <End>

imap <Esc>[7~ <Home>
imap <Esc>[8~ <End>

inoremap <S-Tab> <C-V><Tab>

" Changes for vimdiff
if &diff
    highlight DiffAdd    cterm=bold ctermfg=red ctermbg=black  gui=none guifg=bg guibg=red
    highlight DiffDelete cterm=bold ctermfg=red ctermbg=black gui=none guifg=bg guibg=red
    highlight DiffChange cterm=bold ctermfg=red ctermbg=black gui=none guifg=bg guibg=red
    highlight DiffText   cterm=bold ctermfg=black ctermbg=red gui=none guifg=bg guibg=red

    " F2-4 select which pane to use in vimdiff, F5 refreshes
    nnoremap <F2> :diffget 2<CR>]c
    nnoremap <F3> :diffget 3<CR>]c
    nnoremap <F4> :diffget 4<CR>]c
    nnoremap <F5> :diffupdate<CR>
endif

" F9 opens directory menu, F10 switches buffers, 
nnoremap <F10> :b <C-Z>
nnoremap <F9> :Ex<CR>
