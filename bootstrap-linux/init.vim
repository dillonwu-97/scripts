" this creates a mapping between ; and shift+:
" nnoremap = for normal mode
" vnoremap = for visual mode
nnoremap ; :
vnoremap ; :

let mapleader=','

" comma + n
nnoremap <Leader>n :NERDTreeToggle<CR>

filetype plugin indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" Inksearch to highlight search
set incsearch
set hlsearch

" Set search case
set ignorecase
set smartcase


" comma + slash
nnoremap <Leader>/ :nohlsearch<CR>

set number
set numberwidth=4
set cursorline


" go up a page with space

nnoremap <Space> <PageDown>
noremap <C-Space> <PageUp>
vnoremap <Space> <PageDown>
vnoremap <C-Space> <PageUp>

nnoremap <C-e> 2<C-e>
vnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
vnoremap <C-y> 2<C-y>

inoremap jk <esc>
inoremap kj <esc>

set mouse=a

