vim.g.mapleader = ' '
local map = vim.keymap.set

-- MAIN
map('i', 'jk', '<Esc>')
map('i', '<C-BS>', '<C-W>', { remap = true })
map('v', '<Leader>y', '"+y', { remap = true })
map('v', '<Leader>d', '"+d', { remap = true })
map('n', '<Leader>p', '"+p', { remap = true })
map('n', '<Leader>0', '<cmd>exe "vertical resize " . (winwidth(0) * 3/2)<CR>')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>')
map('n', '<M-[>', '<cmd>execute "set background=light"<CR>')
map('n', '<M-]>', '<cmd>execute "set background=dark"<CR>')
map('t', '<Esc>', '<C-\\><C-n>')
-- TELESCOPE
local tlbi = require("telescope.builtin")
map('n', '<Leader>tf', tlbi.find_files)
map('n', '<Leader>tg', tlbi.live_grep)
map('n', '<Leader>tb', tlbi.buffers)
map('n', '<Leader>th', tlbi.help_tags)
-- LSP
map('n', '<Leader>ee', vim.diagnostic.open_float)
map('n', '<Leader>aa', vim.lsp.buf.code_action)
map('n', '<Leader>ah', vim.lsp.buf.hover)
map('n', '<Leader>gd', vim.lsp.buf.definition)
map('n', '<Leader>gr', vim.lsp.buf.references)
map('n', '<Leader>gs', vim.lsp.buf.signature_help)
map('n', '<Leader>gi', vim.lsp.buf.implementation)
map('n', '<Leader>gt', vim.lsp.buf.type_definition)
map('n', '<Leader>gw', vim.lsp.buf.document_symbol)
map('n', '<Leader>gW', vim.lsp.buf.workspace_symbol)
map('n', '<Leader>ar', vim.lsp.buf.rename)
map('n', '<Leader>ai', vim.lsp.buf.incoming_calls)
map('n', '<Leader>ao', vim.lsp.buf.outgoing_calls)
map('n', '<Leader>=',  function() vim.lsp.buf.format{ async = true } end)
-- OTHER
map({'n', 't'}, '<Leader>f', require("FTerm").toggle)

