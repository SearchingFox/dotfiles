local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        requires = "nvim-lua/plenary.nvim"
    }
    use "nvim-telescope/telescope-file-browser.nvim"
    use {
        "nvim-neorg/neorg",
        requires = "nvim-lua/plenary.nvim"
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- LANGUAGES
    use "simrat39/rust-tools.nvim"
    use "alaviss/nim.nvim"
    use "ziglang/zig.vim"

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim"
    }
    use {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/vim-vsnip",
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help'
    }
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    
    -- OTHER
    use "numToStr/FTerm.nvim"
    use "p00f/nvim-ts-rainbow"
    use "Julian/lean.nvim"
    use "epwalsh/obsidian.nvim"
    use "p00f/godbolt.nvim"

    use "wuelnerdotexe/vim-enfocado"
    use "nyoom-engineering/oxocarbon.nvim"
    use "cocopon/iceberg.vim"

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }

    use {
        "bennypowers/nvim-regexplainer",
        config = function() require"regexplainer".setup() end,
        requires = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        }
    }

    use {
        "gelguy/wilder.nvim",
        config = function()
            local wilder = require("wilder")
            wilder.setup({modes = {":", "/", "?"}})

            wilder.set_option("pipeline", {
                wilder.branch(
                    wilder.cmdline_pipeline(),
                    wilder.search_pipeline()
                ),
            })

            wilder.set_option("renderer", wilder.popupmenu_renderer(
                -- { highlighter = wilder.basic_highlighter(), },
                wilder.popupmenu_border_theme({
                    border = "rounded",
                })
            ))
        end
    }

    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    use "ggandor/leap.nvim"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
