local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'nvim-neorg/neorg',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- LANGUAGES
    use 'simrat39/rust-tools.nvim'
    use 'alaviss/nim.nvim'
    use 'ziglang/zig.vim'
    -- LSP
    use {
        "williamboman/nvim-lsp-installer",
        "neovim/nvim-lspconfig",
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    -- OTHER
    use 'numToStr/FTerm.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'cocopon/iceberg.vim'
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'bennypowers/nvim-regexplainer',
        config = function() require'regexplainer'.setup()  end,
        requires = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
        }
    }
    use {
        'gelguy/wilder.nvim',
        config = function()
            local wilder = require('wilder')
            wilder.setup({modes = {':', '/', '?'}})

            wilder.set_option('pipeline', {
                wilder.branch(
                    wilder.cmdline_pipeline(),
                    wilder.search_pipeline()
                ),
            })

            wilder.set_option('renderer', wilder.popupmenu_renderer(
                -- { highlighter = wilder.basic_highlighter(), },
                wilder.popupmenu_border_theme({
                    border = 'rounded',
                })
            ))
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
