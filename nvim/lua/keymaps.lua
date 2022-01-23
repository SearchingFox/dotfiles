local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

vim.g.mapleader = ' '

-- system clipboard
map('v', '<leader>y', '"+y', { noremap = false, silent = false })
map('v', '<leader>d', '"+d', { noremap = false, silent = false })
map('n', '<leader>p', '"+p', { noremap = false, silent = false })
-- windows navigation
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)
map('n', '<leader>0', '<cmd>exe "vertical resize " . (winwidth(0) * 3/2)<CR>', default_opts)
-- other
map('i', 'jk', '<Esc>', default_opts)
map('i', '<C-BS>', '<C-W>', { noremap = false, silent = false })
map('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>', default_opts) -- unsets the last search pattern register by hitting return
map('t', '<Esc>', '<C-\\><C-n>', default_opts)
map('n', 'gx', '<cmd>execute "!firefox " . shellescape("<cWORD>")<CR>', default_opts)
map('n', '<M-[>', '<cmd>execute "set background=light"<CR>', default_opts)
map('n', '<M-]>', '<cmd>execute "set background=dark"<CR>', default_opts)
map('n', '<F9>', '<cmd>w<CR>:execute "split term://pwsh"<CR>', default_opts)
-- plugins
-- map('v', '<leader>w', '<Plug>TranslateWV', {silent=true})
-- telescope
map('n', '<C-a>', '<cmd>lua require("telescope.builtin").find_files()<CR>', default_opts)
map('n', '<C-p>', '<cmd>lua require("telescope.builtin").buffers()<CR>', default_opts)
-- lsp
map('n', '<leader>ra', '<cmd>RustStartStandaloneServerForBuffer<CR>', { noremap = true })
map('n', 'ga', '', { callback = vim.lsp.buf.code_action })
map('n', 'gd', '', { callback = vim.lsp.buf.definition })
map('n', 'K',  '', { callback = vim.lsp.buf.hover })
map('n', 'gr', '', { callback = vim.lsp.buf.references })
map('n', 'gs', '', { callback = vim.lsp.buf.signature_help })
map('n', 'gi', '', { callback = vim.lsp.buf.implementation })
map('n', 'gt', '', { callback = vim.lsp.buf.type_definition })
map('n', '<leader>gw', '', { callback = vim.lsp.buf.document_symbol })
map('n', '<leader>gW', '', { callback = vim.lsp.buf.workspace_symbol })
map('n', '<leader>ah', '', { callback = vim.lsp.buf.hover })
map('n', '<leader>af', '', { callback = vim.lsp.buf.code_action })
map('n', '<leader>ee', '', { callback = vim.lsp.util.show_line_diagnostics })
map('n', '<leader>ar', '', { callback = vim.lsp.buf.rename })
map('n', '<leader>=',  '', { callback = vim.lsp.buf.formatting })
map('n', '<leader>ai', '', { callback = vim.lsp.buf.incoming_calls })
map('n', '<leader>ao', '', { callback = vim.lsp.buf.outgoing_calls })
-- map('n', 'gD', '', { callback = vim.lsp.buf.declaration })
-- fterm
map('n', '<A-i>', '<cmd>lua require("FTerm").toggle()<CR>', default_opts)
map('t', '<A-i>', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<CR>', default_opts)
-- vim.cmd("let g:floaterm_keymap_toggle = '<F12>'")
