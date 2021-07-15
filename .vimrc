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
" Plug 'antoinemadec/coc-fzf'
" TODO: look into this
" needs bat installed

" Navigation
" ----------
Plug 'takac/vim-hardtime'
Plug 'yuttie/comfortable-motion.vim'
Plug 'phaazon/hop.nvim'
Plug 'Yilin-Yang/vim-markbar'

" Text 
" ------------
Plug 'tpope/vim-commentary' "comments

" Snippets and completion
" -----------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Visual
" ------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'xtal8/traces.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ron-rs/ron.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
":TSInstall python
":TSInstall rust

" Etc
" ---
Plug 'tpope/vim-fugitive' " git especially merging over cmdline
Plug 'tpope/vim-eunuch' "for :SudoWrite and etc
Plug 'tpope/vim-repeat' "enables repeats on tpopes plugins
Plug 'simnalamburt/vim-mundo'

" Bench
" -----
" Plug 'raimondi/delimitmate'
" Plug 'honza/vim-snippets'
" Plug 'hynek/vim-python-pep8-indent'
" Plug 'tpope/vim-surround' "surrounding character pairs
" Plug 'junegunn/vim-easy-align' "align on characters
" Plug 'Valloric/MatchTagAlways'
" Plug 'cespare/vim-toml'

call plug#end()

let g:coc_global_extensions = ['coc-snippets', 'coc-pyright', 'coc-rust-analyzer', 'coc-pairs']

" === Tree sitter settings ===

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
" let g:indent_blankline_space_char_highlight_list = ['CursorLine', 'Function']
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
" let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_context_patterns = ['class', 'function', 'method', 'if', 'let', 'match']

" === Neovide Settings ===
set guifont=OperatorMono\ Nerd\ Font:h32
let g:neovide_cursor_vfx_mode = "pixiedust"


" ==== Big Changes ====
noremap! jk <Esc>
" nnoremap <Space> :
nnoremap <cr> o<esc>
let mapleader = ","
" No Entering Ex mode
" Formatting, TextMate-style
nnoremap Q gqip
vnoremap Q gq

" ==== Folding ====
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

" what does this do??
" autocmd BufReadPost *
" \ if line("'\"") >= 1 && line("'\"") <= line("$") |
" \   execute "normal! g`\"" |
" \ endif

" ==== Formatting ====
set formatoptions=tcnjq1
set expandtab
" set shiftwidth=0
" set shiftround
" set softtabstop=2
" set tabstop=2
" set textwidth=79
set virtualedit=block
set nowrap
"}}}


" ==== Display ====
set termguicolors
set number
" set relativenumber " off so I use S more
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

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='medium'
set background=dark    " Setting dark mode
colorscheme gruvbox

" set wildignore+=.hg,.git,.svn                    " Version control
" set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
" set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
" set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
" set wildignore+=*.spl                            " compiled spelling word lists
" set wildignore+=*.sw?                            " Vim swap files
" set wildignore+=*.DS_Store                       " OSX bullshit
" set wildignore+=*.luac                           " Lua byte code
" set wildignore+=migrations                       " Django migrations
" set wildignore+=*.pyc                            " Python byte code
" set wildignore+=*.orig                           " Merge resolution files


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

" let g:surround_indent = 1 "auto re-indent


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
" nnoremap vv ^vg_

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow


" ==== Filetypes ====
au BufRead,BufNewFile *.dock setfiletype dockerfile
au BufNewFile,BufRead *.md set filetype=markdown

" ensures latex not plaintex chosen when opening a blank .tex file
let g:tex_flavor='latex'

" function! MyFormatExpr(start, end)
"     silent execute a:start.','.a:end.'s/[.!?]\zs /\r/g'
" endfunction


" augroup ft_tex
"     au!
"     au FileType tex setlocal formatoptions="" 
"     au FileType tex setlocal textwidth=0
"     au FileType tex setlocal wrapmargin=0
"     au FileType tex setlocal wrap
"     au FileType tex setlocal linebreak
"     au FileType tex setlocal breakindent
"     au FileType tex setlocal shiftwidth=2 
"     au FileType tex setlocal tabstop=2 
"     au FileType tex setlocal spelllang=en_gb 
"     au FileType tex setlocal iskeyword+=: 
"     au FileType tex setlocal formatexpr=MyFormatExpr(v:lnum,v:lnum+v:count-1)
" augroup END
" augroup ft_python
"     au!
"     au FileType python setlocal formatoptions=cqr 
"     au FileType python let b:delimitMate_expand_inside_quotes = 1
"     au FileType python let b:delimitMate_nesting_quotes = ['"']
" augroup END
" augroup ft_markdown
"   au!
"   au FileType markdown setlocal commentstring=[//]\:\ \#\ (%s)
" augroup END
" augroup ft_cpp
"   au!
"   au FileType cpp setlocal commentstring=//\ %s
" augroup END
" augroup ft_mail
"   " Mail
"   autocmd BufRead,BufNewFile *mutt-* setfiletype mail 
"   autocmd BufRead,BufNewFile *mutt-* setlocal tw=72 spell formatoptions=tcqj
" augroup END

" === Git merging ===
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdt :diffget //2<CR> 
nnoremap gdm :diffget //3<CR>

" === Plugin Configs ===

" == hop
" :HopWord: hop around by highlighting words.
" :HopPattern: hop around by matching against a pattern (as with /).
" :HopChar1: type a single key and hop to any occurrence of that key in the document.
" :HopChar2: type a bigram (two keys) and hop to any occurrence of that bigram in the document.
" :HopLine: jump to any visible line in your buffer.

" == markbar ==

" Jump to marks using <Enter>,
" Move the cursor to the next mark in the markbar using n,
" Move the cursor to the previous mark in the markbar using N,
" Rename marks using r,
" Clear the name of a mark using c,
" Delete marks entirely using d.
" peekaboo press ' or `
nmap <Leader>m <Plug>ToggleMarkbar

" == fzf ==
" let g:fzf_nvim_statusline = 0 " statusline overwriting?
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <leader>l :FzfLines<CR>
nnoremap <silent> <leader>r :FzfRg<CR>
nnoremap <silent> <leader>f :FzfFiles<CR>
nnoremap <silent> <leader>b :FzfBuffers<CR>

" == vim-sneak ==
"let g:sneak#label = 1
""replace 'f' with 1-char Sneak
"nmap f <Plug>Sneak_f
"nmap F <Plug>Sneak_F
"xmap f <Plug>Sneak_f
"xmap F <Plug>Sneak_F
"omap f <Plug>Sneak_f
"omap F <Plug>Sneak_F
""replace 't' with 1-char Sneak
"nmap t <Plug>Sneak_t
"nmap T <Plug>Sneak_T
"xmap t <Plug>Sneak_t
"xmap T <Plug>Sneak_T
"omap t <Plug>Sneak_t
"omap T <Plug>Sneak_T

" == vim-hardtime ==
let g:hardtime_allow_different_key = 1
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 2
let g:list_of_normal_keys = ["h", "j", "k", "l"]
let g:list_of_visual_keys = ["h", "j", "k", "l"]
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
" nnoremap <leader>h :HardTimeToggle

" == CamelCaseMotion ==
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge
" omap <silent> iw <Plug>CamelCaseMotion_iw
" xmap <silent> iw <Plug>CamelCaseMotion_iw
" omap <silent> ib <Plug>CamelCaseMotion_ib
" xmap <silent> ib <Plug>CamelCaseMotion_ib
" omap <silent> ie <Plug>CamelCaseMotion_ie
" xmap <silent> ie <Plug>CamelCaseMotion_ie

" == vim-easy-align ==
" Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

" == delimitMate ==
" let delimitMate_expand_space = 1
" let delimitMate_expand_cr = 2

" == Coc ==
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" TODO explore this
" nmap <silent><nowait> <space>a  <Plug>(coc-codeaction-cursor)

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
nnoremap <leader>u :MundoToggle<CR>

