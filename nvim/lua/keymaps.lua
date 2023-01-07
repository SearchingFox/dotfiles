vim.g.mapleader = " "
local map = vim.keymap.set

-- MAIN
map("t", "<Esc>", "<C-\\><C-n>")
map("i", "jk", "<Esc>")
map("i", "<C-BS>", "<C-W>", { remap = true })
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map({"v", "n"}, "<Leader>y", [["+y]])
map("n", "<Leader>Y", [["+Y]])
map("v", "<Leader>d", [["+d]])
map("n", "<Leader>p", [["+p]])
-- map("x", "<Leader>p", [["_dP]])
map("n", "<Leader>0", "<cmd>execute \"vertical resize \" . (winwidth(0) * 3/2)<CR>")
map("n", "<Leader>w", "<cmd>w<CR>")
map("n", "Q", "<nop>")
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<M-[>", "<cmd>execute \"set background=light\"<CR>")
map("n", "<M-]>", "<cmd>execute \"set background=dark\"<CR>")
map("n", "<Leader>il", "<cmd>e ~/AppData/Local/nvim/init.lua<CR>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- TELESCOPE
local tlbi = require"telescope.builtin"
map("n", "<Leader>sw", tlbi.grep_string)
map("n", "<Leader>tf", tlbi.find_files)
map("n", "<Leader>tg", tlbi.live_grep)
map("n", "<Leader>tb", tlbi.buffers)
map("n", "<Leader>th", tlbi.help_tags)
map("n", "<Leader>td", tlbi.diagnostics)
map("n", "<Leader>fb", "<cmd>Telescope file_browser<CR>")
-- LSP
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<Leader>e", vim.diagnostic.open_float)
map("n", "<Leader>a", vim.lsp.buf.code_action)
map("n", "<Leader>h", vim.lsp.buf.hover)

map("n", "<Leader>ld", vim.lsp.buf.definition)
map("n", "<Leader>lr", vim.lsp.buf.references)
map("n", "<Leader>ls", vim.lsp.buf.signature_help)
map("n", "<Leader>li", vim.lsp.buf.implementation)
map("n", "<Leader>lt", vim.lsp.buf.type_definition)
map("n", "<Leader>lw", vim.lsp.buf.document_symbol)
map("n", "<Leader>lW", vim.lsp.buf.workspace_symbol)
map("n", "<Leader>lr", vim.lsp.buf.rename)
map("n", "<Leader>li", vim.lsp.buf.incoming_calls)
map("n", "<Leader>lo", vim.lsp.buf.outgoing_calls)
map("n", "<Leader>lf", function() vim.lsp.buf.format{ async = true } end)
-- DAP
map("n", "<Leader>db", require"dap".toggle_breakpoint)
-- HOP
local hop = require('hop')
local directions = require('hop.hint').HintDirection
map('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
map('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
map('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
map('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})
-- OTHER
map({"n", "t"}, "<Leader>ft", require"FTerm".toggle)
map(
  "n",
  "gf",
  function()
    if require('obsidian').util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true}
)

