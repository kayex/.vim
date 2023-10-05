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
set colorcolumn=100
set splitbelow
set splitright
"set termwinsize=20x0

colo iceberg

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
  Plug 'tpope/vim-commentary'
  Plug 'SirVer/ultisnips'
call plug#end()

" Custom bindings
let mapleader = ","

imap <C-h> <Left>
imap <C-l> <Right>

" Open and source vimrc
nmap <leader>1 :vsp ~/.vim/vimrc<CR>
nmap <leader>2 :so ~/.vim/vimrc<CR>

" Remove search highlights
nnoremap <silent> <Leader>/ :set invhlsearch<CR>

" Location List
nnoremap <silent> <Leader>. :lcl<CR>:ccl<CR>
nnoremap <C-j> :lnext<CR>
nnoremap <C-k> :lprev<CR>

" Quick fix list
nmap <C-e> :cnext<CR>
nmap <C-u> :cprev<CR>

" Terminal
nnoremap <silent> <S-Tab> :terminal ++rows=20<CR>

" Omni completion
set completeopt-=preview
inoremap <NUL> <C-x><C-o>
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_startofline = 0
nmap s <Plug>(easymotion-overwin-f)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" NERDTree
nnoremap <silent> <Leader>' :NERDTreeToggle<CR>

" vim-go
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

nnoremap <Leader>t :GoRename<CR>
nnoremap <Leader>c :GoCallers<CR>
nnoremap <Leader>r :GoTestFunc<CR>
nnoremap <Leader>d :GoDoc<CR>
nnoremap <Leader>f :GoFmt<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<Tab>"

" Write with sudo
command W w !sudo tee % > /dev/null

" Scratch file settings
function Scratch()
  setlocal noswapfile
  setlocal buftype=nofile
  setlocal bufhidden=hide
endfunction
