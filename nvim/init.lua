require('keymaps')
require('plugins')
require('lsp_config')
local o = vim.opt

o.encoding = 'utf-8'
o.title = true
o.mouse = 'a'
o.startofline = false -- jump to the first non-blank character
o.showmatch = false
o.number = true
o.relativenumber = true
o.showmode = true
o.visualbell = true
o.ignorecase = true
o.smartcase = true
o.wildmode = 'longest:list,full'
o.wildignorecase = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.smartindent = true
o.splitbelow = true
o.cursorline = true
o.lazyredraw = true -- faster macros
o.autochdir = true
o.list = true
o.listchars = { trail= '~', tab = '>~' }
o.signcolumn = 'number'
o.pumblend = 15

-- Appearance
o.guifont = 'Fira Code:h14,Agave:h16,VictorMono NF:h14'
o.termguicolors = true
vim.cmd'colorscheme iceberg'
-----

-- Shell
o.shell = 'pwsh.exe'
o.shellquote = '('
o.shellpipe = '|'
o.shellredir = '>'
o.shellxquote = ''
o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command'
-----

-- Highlight copied text
vim.api.nvim_exec([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
    augroup end
]], false)

-- Compile plugins.lua on save
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])

-- Automatically source init.vim file on save
vim.cmd([[
    augroup autosourcing
        autocmd!
        autocmd BufWritePost init.lua source <afile>
    augroup END
]])
-----

session_file = vim.fn.stdpath('config') .. '/sessions/session.vim'
function session_load()
    if session_file then
        vim.cmd('silent source ' .. session_file)
    else
        print("Can't load session file!")
    end
end

function session_save()
    if vim.fn.filereadable(session_file) then
        vim.cmd('silent mksession! ' .. session_file)
    else
        print("Can't save session file!")
    end
end

vim.cmd([[
    autocmd VimEnter * nested :lua session_load()
    autocmd VimLeave * :lua session_save()
]])
----

vim.cmd([[
    autocmd TermOpen * startinsert
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufEnter * silent! lcd %:p:h
]])

-- Plugins' settings
o.completeopt = 'menuone,noinsert,noselect'
local parser_configs = require'nvim-treesitter.parsers'.get_parser_configs()
parser_configs.norg = {
    install_info = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg',
        files = { 'src/parser.c', 'src/scanner.cc' },
        branch = 'main'
    },
}

parser_configs.norg_meta = {
    install_info = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
        files = { 'src/parser.c' },
        branch = 'main'
    },
}

parser_configs.norg_table = {
    install_info = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
        files = { 'src/parser.c' },
        branch = 'main'
    },
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'lua', 'rust', 'norg', 'norg_meta', 'norg_table', 'haskell', 'cpp', 'c', 'javascript' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

-- Lualine
local function lsp()
    local msg = 'None'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
end

local config = {
    options = { theme = 'iceberg' },
    sections = {
        lualine_c = { lsp },
    },
    tabline = {
        lualine_a = { { 'buffers', mode=2, max_length=140 } }
    }
}
require'lualine'.setup(config)
----

-- FTerm
require'FTerm'.setup({
    cmd = 'pwsh.exe -NoLogo -NoProfile -WorkingDirectory "' .. vim.fn.expand('%:h') .. '"',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})
----

-- Neorg
require'neorg'.setup {
    load = {
        ['core.defaults'] = {}, -- Load all the default modules
        ['core.norg.concealer'] = {}, -- Allows for use of icons
        ['core.norg.dirman'] = { -- Manage your directories with Neorg
            config = {
                workspaces = {
                    my_workspace = 'C:/Users/Asus/Documents/neorg'
                }
            }
        },
        ['core.norg.completion'] = {
            config = {
                engine = 'nvim-cmp'
            }
        }
    }
}
----

if vim.g.nvui then
    vim.cmd[[NvuiCursorAnimationDuration 0.33]]
end
