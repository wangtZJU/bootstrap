set nocompatible

"" Vundle Plugin
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rafi/awesome-vim-colorschemes'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'majutsushi/tagbar'
"Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
" Plugin 'sheerun/vim-polyglot'
Plugin 'Chiel92/vim-autoformat'
Plugin 'derekwyatt/vim-scala'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/vim-auto-save'
Plugin 'hashivim/vim-terraform'
" Plugin 'saltstack/salt-vim'


call vundle#end()
"" Vundle Plugin

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set number
set relativenumber
set cursorline
set ruler
set fileformat=unix
set scrolloff=5            " Always remain 5 lines when do scrolling

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.
set showmatch

set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set ignorecase             " Case Insensitivity Pattern Matching
set smartcase              " Overrides ignorecase if pattern contains upcase
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set wrapscan               " Searches wrap around end-of-file.

" set virtualedit =all
set nofoldenable

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.
set synmaxcol   =1000      " Only highlight 1000 columns.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set report      =0         " Always report changed lines.

" set foldmethod=syntax
" set foldcolumn=3


" Put all temporary files under the same directory.
set directory   =$HOME/.vim/files/swap//

runtime! ftplugin/man.vim


"" functions & commands
com! DiffSaved :w !diff % -

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSavedVerbose call s:DiffWithSaved()
"" functions & commands

"" autocmds
autocmd InsertLeave,WinEnter,BufEnter * setlocal cursorline
autocmd InsertEnter,WinLeave,BufLeave * setlocal nocursorline

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
"" autocmds

"" key mappings
noremap <F1> <Esc>
noremap <C-L> :bnext<CR>
noremap <C-H> :bprevious<CR>
inoremap <C-L> <ESC>:bnext<CR>
inoremap <C-H> <ESC>:bprevious<CR>
noremap ˙ <C-W>h
noremap ∆ <C-W>j
noremap ˚ <C-W>k
noremap ¬ <C-W>l
inoremap ˙ <ESC><C-W>h
inoremap ∆ <ESC><C-W>j
inoremap ˚ <ESC><C-W>k
inoremap ¬ <ESC><C-W>l
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
noremap <LEADER><CR> :noh<CR>
nnoremap <LEADER>1 1gt
nnoremap <LEADER>2 2gt
nnoremap <LEADER>3 3gt
nnoremap <LEADER>4 4gt
nnoremap <LEADER>5 5gt
nnoremap <LEADER>6 6gt
nnoremap <LEADER>7 7gt
nnoremap <LEADER>8 8gt
nnoremap <LEADER>9 9gt
nnoremap <LEADER>y "*y
nnoremap <LEADER>p "*p
vnoremap <LEADER>y "*y
vnoremap <LEADER>p "*p
nnoremap <LEADER><SPACE> :let _s=@/<BAR>:%s/\s\+$//e<BAR>:let @/=_s<BAR><CR>
" swap current line with the above/below line
nnoremap [e  :<C-U>execute 'move -1-'. v:count1<CR>
nnoremap ]e  :<C-U>execute 'move +'. v:count1<CR>
" insert space line above/below the current line
nnoremap [<SPACE>  :<C-U>put! =repeat(nr2char(10), v:count1)<CR>'[
nnoremap ]<SPACE>  :<C-U>put =repeat(nr2char(10), v:count1)<CR>
"" key mappings

"" colorschema
colo molokai
let g:molokai_original = 1
let g:rehash256 = 1
set guifont=Source\ Code\ Variable:h18

if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif
"" colorschema

"" completion
let g:omni_sql_no_default_maps = 1
"" completion

"" templates
"" e.g. au BufNewFile *.ss.scala 0r ~/.vim/templates/skeleton.ss.scala
"" templates

"" plugin configuration
" NERDTree
noremap <F1> :NERDTreeToggle<CR>
inoremap <F1> <Esc>:NERDTreeToggle<CR>
vnoremap <F1> <Esc>:NERDTreeToggle<CR>

" Close Vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" NERDTree

" MiniBufExpl
noremap <Leader>mbt :MBEToggle<cr>
hi MBEVisibleActiveNormal   guifg=#ffffff guibg=#afd700 ctermfg=15 ctermbg=148
hi MBEVisibleActiveChanged  guifg=#ffffff guibg=#af00af ctermfg=15 ctermbg=127
" MiniBufExpl

" Tagbar
" noremap <F2> :TagbarToggle<CR>
" inoremap <F2> <Esc>:TagbarToggle<CR>
" vnoremap <F2> <Esc>:TagbarToggle<CR>
" Tagbar

" Autoformat
let g:formatdef_sql = '"sqlformat --reindent --keywords upper --identifiers lower -"'
let g:formatters_sql = ['sql']
" Autoformat

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

nnoremap <LEADER>sc :SyntasticCheck<CR>
" syntastic

" Ultisnip
" let g:UltiSnipsExpandTrigger="<C-Right>"
" let g:UltiSnipsJumpForwardTrigger="<C-Right>"
" let g:UltiSnipsJumpBackwardTrigger="<C-Left>"
" Ultisnip

" YouCompleteMe
set completeopt-=preview

let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

nnoremap <F3> :YcmCompleter GoTo<CR>
nnoremap <LEADER>gg :YcmCompleter GoTo<CR>
" YouCompleteMe

" vim-airline
let g:airline#extensions#tabline#enabled = 1
" vim-airline
"" plugin configuration


"" Add custom config in ~/.vimrc.ext
source $HOME/.vimrc.ext
