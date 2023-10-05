set nocompatible

set number
set history=1000
set autoread
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set tabstop=4
set shiftwidth=4
"set termwinsize=20x0

"colo seoul256
colo apprentice

filetype plugin indent on

" Auto save
autocmd CursorHoldI,CursorHold * silent! update

" Plugins
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Go
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

let g:go_auto_type_info = 1

let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Custom binds
let mapleader = ","

imap <C-h> <Left>
imap <C-l> <Right>

nnoremap <silent> <Leader>/ :noh<CR>

" Location List
nnoremap <silent> <Leader>. :lcl<CR>:ccl<CR>
nnoremap <C-j> :lnext<CR>
nnoremap <C-k> :lprev<CR>

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_startofline = 0
nmap s <Plug>(easymotion-overwin-f)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" NERDTree
nnoremap <Leader>' :NERDTreeToggle<CR>

" Go
nnoremap <Leader>t :GoRename<CR>
nnoremap <Leader>c :GoCallers<CR>
nnoremap <Leader>r :GoTestFunc<CR>
nnoremap <Leader>d :GoDoc<CR>
nnoremap <Leader>f :GoFmt<CR>

" Omni completion
"inoremap <C-Space> <C-x><C-o>

set completeopt+=menuone,noinsert
set completeopt-=preview

function! OpenCompletion()
    if !pumvisible() && ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
        call feedkeys("\<C-x>\<C-o>", "n")
    endif
endfunction

autocmd InsertCharPre *.go call OpenCompletion()

inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

command W w !sudo tee % > /dev/null

function Scratch()
  setlocal noswapfile
  setlocal buftype=nofile
  setlocal bufhidden=hide
endfunction
