-- Plugins

set['packpath'] = 'C:\\nvim'
set['runtimepath'] = set['runtimepath'] .. ',' .. set['packpath']

cmd [[packadd packer.nvim]]
Packer = require('packer')

Packer.init({
    ensure_dependencies   = true, -- Should packer install plugin dependencies?

    -- Used to specify a new directory for package management.
    package_root   = set['packpath'] .. '\\pack',
    compile_path = set['packpath'] .. '\\plugin\\packer_compiled.vim',
})

return Packer.startup(function()
    use 'wbthomason/packer.nvim'

    -- Colorscheme/Visual plugins

    use 'itchyny/vim-gitbranch'
    use 'kyazdani42/nvim-web-devicons'
    use 'rafi/awesome-vim-colorschemes'
    use {
        'kaicataldo/material.vim',
        branch = 'main',
    }

    use 'lukas-reineke/indent-blankline.nvim'

    use 'airblade/vim-gitgutter'
    use 'mhinz/vim-signify'

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- LSP Plugins

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'ojroques/nvim-lspfuzzy'

    use 'simrat39/rust-tools.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = function() fn['TSUpdate']() end }

    use 'hrsh7th/nvim-compe'

    -- Navigation Plugins

    -- use { 'junegunn/fzf', run = function() fn['fzf#install']() end }
    -- use 'junegunn/fzf.vim'

    use 'pechorin/any-jump.vim'
    use 'kyazdani42/nvim-tree.lua'
    use 'romgrk/barbar.nvim'

    -- Formatting Plugins

    use 'machakann/vim-sandwich'
    use 'bfrg/vim-cpp-modern'
end)
