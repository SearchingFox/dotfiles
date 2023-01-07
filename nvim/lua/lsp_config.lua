require"mason".setup()
require"mason-lspconfig".setup({
    ensure_installed = { "rust_analyzer" },
})

local rt = require'rust-tools'
local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        runnables = {
            use_telescope = true
            -- rest of the opts are forwarded to telescope
        },
        debuggables = {
            use_telescope = true
        },
        hover_actions = {
            border = {
              {"╭", "FloatBorder"}, {"─", "FloatBorder"},
              {"╮", "FloatBorder"}, {"│", "FloatBorder"},
              {"╯", "FloatBorder"}, {"─", "FloatBorder"},
              {"╰", "FloatBorder"}, {"│", "FloatBorder"}
            },
            -- whether the hover action window gets automatically focused
            auto_focus = true
        },
        crate_graph = {
            backend = "jpg"
        },
        dap = {
            adapter = {
                type = "executable",
                command = "lldb-vscode",
                name = "rt_lldb",
            },
        },
    },

    server = {
        on_attach = function(_, bufnr)
              vim.keymap.set("n", "<Leader>ha", rt.hover_actions.hover_actions, { buffer = bufnr })
              vim.keymap.set("n", "<Leader>ag", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
        settings = {
            ['rust-analyzer'] = {
                assist = {
                    importGranularity = 'module',
                    importPrefix = 'by_self',
                },
                cargo = {
                    loadOutDirsFromCheck = true
                },
                procMacro = {
                    enable = true
                },
                checkOnSave = {
                    command = 'clippy'
                },
            }
        }
    },
}
rt.setup(opts)

local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'neorg' }
    },
})

-- DAP
local dap = require('dap')
dap.set_log_level('DEBUG')

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.lldb = {
  type = 'executable',
  command = 'C:/Program Files/LLVM/bin/lldb-vscode.exe', -- adjust as needed, must be absolute path
  name = 'lldb'
}
---

-- DAP-UI
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    {
      elements = {
        "scopes",
      },
      size = 0.3,
      position = "right"
    },
    {
      elements = {
        "repl",
        "breakpoints"
      },
      size = 0.3,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})

vim.fn.sign_define('DapBreakpoint', { text = '🐝' })

-- Start debugging session
vim.keymap.set("n", "<localleader>ds", function()
  dap.continue()
  ui.toggle({})
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end)

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "<localleader>dl", require("dap.ui.widgets").hover)
vim.keymap.set("n", "<localleader>dc", dap.continue)
vim.keymap.set("n", "<localleader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<localleader>dn", dap.step_over)
vim.keymap.set("n", "<localleader>di", dap.step_into)
vim.keymap.set("n", "<localleader>do", dap.step_out)
vim.keymap.set("n", "<localleader>dC", function()
  dap.clear_breakpoints()
  require("notify")("Breakpoints cleared", "warn")
end)

-- Close debugger and clear breakpoints
vim.keymap.set("n", "<localleader>de", function()
  dap.clear_breakpoints()
  ui.toggle({})
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
  require("notify")("Debugger session ended", "warn")
end)
---

require('lspconfig').clangd.setup {
        -- on_attach = keybinds.on_attach,
        cmd = {
            "clangd",
            "--background-index",
            "--suggest-missing-includes",
            '--query-driver="/usr/local/opt/gcc-arm-none-eabi-8-2019-q3-update/bin/arm-none-eabi-gcc"'
        },
        filetypes = {"c", "cpp", "objc", "objcpp"},
}

require('lspconfig').hls.setup {
    -- on_attach = on_attach,
    settings = {
        haskell = {
            hlintOn = true,
            formattingProvider = "fourmolu"
        }
    }
}
-- require'lspconfig'.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }

-- local function on_attach(_, bufnr)
--     local function cmd(mode, lhs, rhs)
--       vim.keymap.set(mode, lhs, rhs, { noremap = true, buffer = true })
--     end
-- 
--     -- Autocomplete using the Lean language server
--     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 
--     -- gd in normal mode will jump to definition
--     cmd('n', 'gd', vim.lsp.buf.definition)
--     -- K in normal mode will show the definition of what's under the cursor
--     cmd('n', 'K', vim.lsp.buf.hover)
-- 
--     -- <leader>n will jump to the next Lean line with a diagnostic message on it
--     -- <leader>N will jump backwards
--     cmd('n', '<leader>n', function() vim.lsp.diagnostic.goto_next{popup_opts = {show_header = false}} end)
--     cmd('n', '<leader>N', function() vim.lsp.diagnostic.goto_prev{popup_opts = {show_header = false}} end)
-- 
--     -- <leader>K will show all diagnostics for the current line in a popup window
--     cmd('n', '<leader>K', function() vim.lsp.diagnostic.show_line_diagnostics{show_header = false} end)
-- 
--     -- <leader>q will load all errors in the current lean file into the location list
--     -- (and then will open the location list)
--     -- see :h location-list if you don't generally use it in other vim contexts
--     cmd('n', '<leader>q', vim.lsp.diagnostic.set_loclist)
-- end

-- require('lean').setup{
--   abbreviations = { builtin = true },
--   lsp = { on_attach = on_attach },
--   mappings = true,
-- }

-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     virtual_text = { spacing = 4 },
--     update_in_insert = true,
--   }
-- )
