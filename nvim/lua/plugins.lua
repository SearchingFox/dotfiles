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
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- LANGUAGES
    use 'simrat39/rust-tools.nvim'
    use 'alaviss/nim.nvim'
    use 'ziglang/zig.vim'
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'
    -- OTHER
    use 'numToStr/FTerm.nvim'
    use 'voldikss/vim-floaterm'
    use 'p00f/nvim-ts-rainbow'
    use 'cocopon/iceberg.vim'
    use 'Shatur/neovim-ayu'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
