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

    use 'kyazdani42/nvim-web-devicons'

    use 'marko-cerovac/material.nvim'

    use 'hoob3rt/lualine.nvim'

    use 'airblade/vim-gitgutter'
    use 'mhinz/vim-signify'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    }

    -- LSP Plugins

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp_extensions.nvim'
    use 'ojroques/nvim-lspfuzzy'

    use 'glepnir/lspsaga.nvim'

    use 'simrat39/rust-tools.nvim'

    use 'ray-x/lsp_signature.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = function() fn['TSUpdate']() end }

    use 'hrsh7th/nvim-compe'

    -- Navigation Plugins

    use 'pechorin/any-jump.vim'
    use 'kyazdani42/nvim-tree.lua'
    use 'romgrk/barbar.nvim'

    -- Formatting Plugins

    use 'bfrg/vim-cpp-modern'
end)
