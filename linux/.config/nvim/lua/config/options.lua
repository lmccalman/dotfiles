-- set wrap
-- set linebreak
-- set foldmethod=marker
-- set hidden  " let me move buffers without saving
-- set undodir=~/.vim/tmp/undo//     " undo files
-- set directory=~/.vim/tmp/swap//   " swap files
-- " Make those folders automatically if they don't already exist.
-- if !isdirectory(expand(&undodir))
--     call mkdir(expand(&undodir), "p")
-- endif
-- if !isdirectory(expand(&directory))
--     call mkdir(expand(&directory), "p")
-- endif
-- " Enable undofiles (writebackup on by default)
-- set undofile
-- set autoread
-- set viewoptions-=options
-- set sessionoptions-=options
-- set viewoptions-=localoptions
-- set sessionoptions-=localoptions
-- set termguicolors
-- " set number
-- " set relativenumber " off so I use S more
-- set title
-- set ruler
-- set number
-- set relativenumber
-- set scrolloff=9999
-- set sidescroll=1
-- set sidescrolloff=1
-- set showmatch
-- set lazyredraw "don't redraw whilst running macros
-- set display=uhex " affects the last line somehow
-- set cmdheight=2
-- set cursorline
-- set colorcolumn=+1
-- set laststatus=2
-- set backspace=2
-- set gdefault "this means I don't have to type g in a replace
-- set grepprg=rg\ --vimgrep\ --no-heading
-- set ignorecase
-- set matchpairs+=<:>  "for html etc
-- set smartcase
-- set wildmode=list:longest
-- set autochdir
-- set clipboard=unnamed,unnamedplus
-- set nobackup
-- set nowritebackup
-- set cmdheight=2
-- set updatetime=300

vim.opt.conceallevel = 2
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.formatoptions='tlcnjq1'
vim.opt.expandtab = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = {
  tab = '› ',
  trail = '·',
  eol = '«',
  extends = '>',
  precedes = '<'
}
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.showbreak = '  » '
vim.opt.showtabline = 2
vim.opt.signcolumn = 'number'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.textwidth = 79
vim.opt.termguicolors = true
vim.opt.virtualedit = "block"


require("telescope").load_extension("fzf")

local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})


require('lualine').setup()
require('lspconfig').pyright.setup({})
require'lspconfig'.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", "prettier", stop_after_first = true },
  },
})

require('lint').linters_by_ft = {
  markdown = {'vale',},
  python = {'pylint',},
}

