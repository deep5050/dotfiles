" Enable line numbers
set number

" Highlight search results as you type
set incsearch
set hlsearch

" Enable syntax highlighting
syntax enable

" Show matching parentheses
set showmatch

" Enable auto-indentation
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

" Enable line wrapping
set wrap

" Highlight current line
set cursorline

" Enable clipboard support
set clipboard=unnamedplus

" Enable mouse support (if your terminal supports it)
set mouse=a

" Enable folding
set foldmethod=manual
set foldenable

" Display ruler with line and column numbers
set ruler

" Enable auto-command to strip trailing whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Enable file type detection
filetype plugin indent on

" Set color scheme (choose one you like)
colorscheme desert

" Enable line completion with Ctrl-X Ctrl-L
set complete+=kspell

" Map <F2> to toggle line numbers
nnoremap <F2> :set invnumber<CR>

" Map <F3> to toggle paste mode
nnoremap <F3> :set paste!<CR>

" Map <leader>w to save file
nnoremap <leader>w :w<CR>
