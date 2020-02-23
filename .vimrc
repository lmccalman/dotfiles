" === Keys to Remember
" ctrl+d, ctl+u : smooth down/up scrolling
" cs"' to change pairs from " to '
" ysiw] to put ] around iw
" yssib or yssi) to put brackets around line
" in visual mode selected a line:
" S<p class="blah">
" all the above surrounds work with .
" leader+ tm : table mode
" in visual mode: ga=  : align selected about equal
" gaip= :  align inner paragraph around =
" gS to split a one-liner into multiple lines
" gJ to join a block into a single line (inside the block)

" ==== Plugins ====

" auto-install plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Buffers and Search
" ------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Navigation
" ----------
Plug 'justinmk/vim-sneak'
Plug 'takac/vim-hardtime'
Plug 'bkad/CamelCaseMotion'
Plug 'yuttie/comfortable-motion.vim'

" Text 
" ------------
Plug 'tpope/vim-surround' "surrounding character pairs
Plug 'junegunn/vim-easy-align' "align on characters
Plug 'tpope/vim-commentary' "comments
" Plug 'tweekmonster/braceless.vim' "indentation levels

" Prose
" -----
Plug 'lervag/vimtex'

" Snippets and completion
" -----------------------
Plug 'raimondi/delimitmate'
Plug 'honza/vim-snippets'
Plug 'hynek/vim-python-pep8-indent'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-snippts
" :CocInstall coc-python
" :CocInstall coc-vimtex
" :CocInstall coc-rls


" Visual
" ------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kshenoy/vim-signature' "for displaying marks on the left ruler
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'xtal8/traces.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'ryanoasis/vim-devicons'

" Etc
" ---
Plug 'tpope/vim-eunuch' "for :SudoWrite and etc
Plug 'tpope/vim-repeat' "enables repeats on tpopes plugins
Plug 'AndrewRadev/splitjoin.vim' "1 line ifs / multiline ifs
Plug 'simnalamburt/vim-mundo'

call plug#end()

" === Plugin Configs ===

" == fzf ==
" let g:fzf_nvim_statusline = 0 " statusline overwriting?
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <leader>l :FzfLines<CR>
nnoremap <silent> <leader>r :FzfRg<CR>
nnoremap <silent> <leader>f :FzfFiles<CR>
nnoremap <silent> <leader>b :FzfBuffers<CR>

" == vim-sneak ==
let g:sneak#label = 1
"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" == vim-hardtime ==
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "j", "k", "l"]
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
nnoremap <leader>h :HardTimeToggle

" == CamelCaseMotion ==
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" == vim-easy-align ==
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" == delimitMate ==
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 2

" == Coc ==

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" == airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" == Goyo and Limelight
let g:limelight_default_coefficient = 0.5
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
let g:goyo_width = 80
let g:goyo_height = 85 
let g:goyo_linenr = 0
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" == mundo
nnoremap <F5> :MundoToggle<CR>

" ==== Big Changes ====
noremap! jk <Esc>
nnoremap <Space> :
nnoremap <cr> o<esc>
let mapleader = ","
" No Entering Ex mode
" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" ==== Folding ====
" set foldclose=all
" set foldlevel=0
" set foldlevelstart=0
set foldmethod=marker

" ==== IO ====
set hidden  " let me move buffers without saving
set undodir=~/.vim/tmp/undo//     " undo files
set directory=~/.vim/tmp/swap//   " swap files
" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" Enable undofiles (writebackup on by default)
set undofile
set autoread
" Remove trailing whitespace in python
autocmd BufWritePre *.py :%s/\s\+$//e

" Save cursor, folds etc from last edit
set viewoptions-=options
set sessionoptions-=options
set viewoptions-=localoptions
set sessionoptions-=localoptions

autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   execute "normal! g`\"" |
\ endif

" ==== Formatting ====
set autoindent
set formatoptions=tcnjq1
set linebreak
set expandtab
set softtabstop=-1
set shiftwidth=0
set shiftround
set tabstop=2
set textwidth=79
set virtualedit=block
set wrap
"}}}


" ==== Display ====
set termguicolors
set number
set relativenumber " off so I use S more
set title
set ruler
set scrolloff=9999
set sidescroll=1
set sidescrolloff=1
set showmatch
set lazyredraw "don't redraw whilst running macros
set display=uhex " affects the last line somehow
set cmdheight=2
set cursorline
set colorcolumn=+1
set laststatus=2

let g:rainbow_active = 1

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='medium'
set background=dark    " Setting dark mode
colorscheme gruvbox

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files


" ==== Navigation ====
"N00bs beware
inoremap  <Esc>    <NOP>

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" Mouse tiem
set mouse=a

" let g:neomake_open_list = 1
" let g:neomake_list_height = 10

" ==== Editing ====
"set backspace=eol,start,indent "Try not to use backspace!
set backspace=2
" Change indent continuously
vmap < <gv
vmap > >gv
" allow the . to execute once for each line of a visual block
vnoremap . :normal .<CR>
" make Y consistent with C and D. See :help Y.
nnoremap Y y$
" spelling fix
nnoremap zz z=
nnoremap z= :echo "use zz you idiot"<cr>
" Dates
:nnoremap <F6> "=strftime("%d_%b_%Y")<CR>P
:inoremap <F6> <C-R>=strftime("%d_%b_%Y")<CR>

let g:surround_indent = 1 "auto re-indent


augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost ~/.vimrc source ~/.vimrc
augroup END " }


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

let g:ags_enable_async = 1

" ==== Buffers ====
set autochdir
nnoremap <leader>s :b#<CR>
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>w :update<CR>

" ==== Clipboard and Undo ====
set pastetoggle=<leader>p
set clipboard=unnamed,unnamedplus

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


" ==== Filetypes ====
au BufRead,BufNewFile *.dock setfiletype dockerfile
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mako set filetype=mako
" ensures latex not plaintex chosen when opening a blank .tex file
let g:tex_flavor='latex'

function! MyFormatExpr(start, end)
    silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
endfunction


augroup ft_tex
    au!
    au FileType tex setlocal formatoptions="" 
    au FileType tex setlocal textwidth=0
    au FileType tex setlocal wrapmargin=0
    au FileType tex setlocal wrap
    au FileType tex setlocal linebreak
    au FileType tex setlocal breakindent
    au FileType tex setlocal shiftwidth=2 
    au FileType tex setlocal tabstop=2 
    au FileType tex setlocal spelllang=en_gb 
    au FileType tex setlocal iskeyword+=: 
    au FileType tex setlocal formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)
augroup END
augroup ft_python
    au!
    au FileType python setlocal formatoptions=cqr 
    au FileType python let b:delimitMate_expand_inside_quotes = 1
    au FileType python let b:delimitMate_nesting_quotes = ['"']
augroup END
augroup ft_markdown
  au!
  au FileType markdown setlocal commentstring=[//]\:\ \#\ (%s)
augroup END
augroup ft_cpp
  au!
  au FileType cpp setlocal commentstring=//\ %s
augroup END
augroup ft_mail
  " Mail
  autocmd BufRead,BufNewFile *mutt-* setfiletype mail 
  autocmd BufRead,BufNewFile *mutt-* setlocal tw=72 spell formatoptions=tcqj
augroup END

