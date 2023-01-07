require("plugins")
require("lsp_config")
require("settings")
require("keymaps")

local o = vim.opt
o.mouse = ""
o.encoding = "utf-8"
o.colorcolumn = "100"
o.title = true
o.cmdheight = 0
o.startofline = false -- jump to the first non-blank character
o.showmatch = false
o.showcmd = true
o.number = true
o.relativenumber = true
o.showmode = true
o.visualbell = true
o.ignorecase = true
o.smartcase = true
o.wildmode = "full"
o.wildignorecase = true
o.tabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.expandtab = true
o.splitbelow = true
o.cursorline = true
o.lazyredraw = true -- faster macros
o.autochdir = true
o.list = true
o.listchars = { trail= "~", tab = ">~" }
o.signcolumn = "yes:1"
o.pumblend = 15
o.shell = "pwsh.exe"
o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
o.shellquote = "("
o.shellpipe = "|"
o.shellredir = ">"
o.shellxquote = ""

-- Appearance
vim.cmd "language en_US"
o.guifont = "Iosevka,VictorMono_NF:h15:b"
o.termguicolors = true

vim.g.enfocado_style = "nature"
vim.cmd.colorscheme "enfocado"

if vim.fn.exists("g:neovide") then
    vim.g.neovide_cursor_animation_length=0.05
    vim.g.neovide_transparency=0.9
    vim.g.neovide_refresh_rate=120
end

-- Autocmd
local yankGrp = vim.api.nvim_create_augroup("HighlightYank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function() vim.highlight.on_yank({higroup="IncSearch", timeout=200}) end,
    group = yankGrp,
    desc = "Highlight yank"
})

local writeGrp = vim.api.nvim_create_augroup("WriteOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
    group = writeGrp,
    desc = "Compile plugins.lua on save"
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "init.lua",
    command = "source <afile>",
    group = writeGrp,
    desc = "Source init.lua file on save"
})
