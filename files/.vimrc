" ── General ────────────────────────────────────────────────────────────
set nocompatible              " disable Vi compatibility
set encoding=utf-8
set history=500
set autoread                  " reload file if changed outside vim
set hidden                    " allow switching buffers without saving

" ── UI ─────────────────────────────────────────────────────────────────
set number                    " line numbers
set relativenumber            " relative line numbers
set cursorline                " highlight current line
set showmatch                 " highlight matching brackets
set scrolloff=8               " keep 8 lines above/below cursor
set sidescrolloff=8
set wrap                      " wrap long lines
set linebreak                 " wrap at word boundary
set showcmd                   " show incomplete commands
set wildmenu                  " enhanced command-line completion
set wildmode=longest,list     " complete longest match, then list
set laststatus=2              " always show status line
set ruler
set noerrorbells
set visualbell

" ── Search ─────────────────────────────────────────────────────────────
set incsearch                 " search as you type
set hlsearch                  " highlight results
set ignorecase                " case-insensitive search...
set smartcase                 " ...unless query has uppercase

" ── Indentation ────────────────────────────────────────────────────────
set autoindent
set smartindent
set expandtab                 " spaces instead of tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4

" ── Files & backup ─────────────────────────────────────────────────────
set nobackup
set noswapfile
set undofile                  " persistent undo across sessions
set undodir=~/.vim/undodir

" ── Splits ─────────────────────────────────────────────────────────────
set splitbelow                " new horizontal split goes below
set splitright                " new vertical split goes right

" ── Keybindings ────────────────────────────────────────────────────────
let mapleader = " "

" clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" save and quit shortcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" keep cursor centred when jumping
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" ── Colours ────────────────────────────────────────────────────────────
syntax on
set background=dark
set termguicolors
colorscheme desert            " built-in fallback; replace with your preferred theme

" ── Misc ───────────────────────────────────────────────────────────────
set backspace=indent,eol,start
set clipboard=unnamedplus     " use system clipboard by default
set mouse=a                   " enable mouse support
filetype plugin indent on
