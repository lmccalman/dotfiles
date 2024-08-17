vim.keymap.set('i', "jk", "<Escape>")


local telescope_bi = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', telescope_bi.find_files, {})
vim.keymap.set('n', '<leader>l', telescope_bi.live_grep, {})
vim.keymap.set('n', '<leader>b', telescope_bi.buffers, {})
-- vim.keymap.set('n', '<leader>fh', telescope_bi.help_tags, {})

-- previous buffer
vim.keymap.set('n', '<leader>s', ':b#<CR>')

-- nnoremap <silent> <leader>l :FzfLines<CR>
-- nnoremap <silent> <leader>r :FzfRg<CR>
-- nnoremap <silent> <leader>f :FzfFiles<CR>
-- nnoremap <silent> <leader>b :FzfBuffers<CR>

vim.keymap.set('n', 'Q', 'gqip')
vim.keymap.set('v', 'Q', 'gq')

-- Fix linewise visual selection of various text objects
vim.keymap.set("n", "VV", "V")
vim.keymap.set("n", "Vit", "vitVkoj")
vim.keymap.set("n", "Vat", "vatV")
vim.keymap.set("n", "Vab", "vabV")
vim.keymap.set("n", "VaB", "vaBV")

vim.keymap.set("n", "/", "/\\M")
vim.keymap.set("v", "/", "/\\M")
vim.keymap.set("n", "?", "?\\M")
vim.keymap.set("v", "?", "?\\M")
vim.keymap.set("n", ":s/", ":s/\\M")

