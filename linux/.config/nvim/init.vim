


" nnoremap <Space> :
" nnoremap <cr> o<esc>
" No Entering Ex mode
" Formatting, TextMate-style
nnoremap Q gqip
filetype plugin indent on

" auto-install plug if it doesn't exist
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


" Buffers and Search
" ------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Navigation
" ----------
Plug 'dbakker/vim-paragraph-motion'

" Text 
" ------------
Plug 'tpope/vim-commentary' "comments

" Visual
" ------
Plug 'sainnhe/gruvbox-material'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'

" Etc
" ---
Plug 'tpope/vim-repeat' "enables repeats on tpopes plugins

call plug#end()


if exists('g:vscode')
    	" VSCode extension
else
	" ordinary Neovim
	"N00bs beware
	noremap! jk <Esc>
	inoremap  <Esc>    <NOP>
endif

let g:rainbow_active = 1

vnoremap Q gq

let mapleader = ","

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV

" Change indent continuously
vmap < <gv
vmap > >gv
" allow the . to execute once for each line of a visual block
vnoremap . :normal .<CR>
" make Y consistent with C and D. See :help Y.
nnoremap Y y$

" ==== Searching ====
set gdefault "this means I don't have to type g in a replace
set grepprg=rg\ --vimgrep\ --no-heading
set ignorecase
set matchpairs+=<:>  "for html etc
set smartcase
set wildmode=list:longest

nnoremap / /\M
vnoremap / /\M
nnoremap ? ?\M
vnoremap ? ?\M
nnoremap :s/ :s/\M


" ==== Buffers ====
set autochdir
nnoremap <leader>s :b#<CR>
" nnoremap <Leader>c :bd<CR>
nnoremap <Leader>w :update<CR>

" ==== Clipboard and Undo ====
set pastetoggle=<leader>p
set clipboard=unnamed,unnamedplus
