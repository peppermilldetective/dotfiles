-- Plugins

cmd [[packadd packer.nvim]]
Packer = require('packer')

Packer.init({
    ensure_dependencies   = true, -- Should packer install plugin dependencies?
})

return Packer.startup(function()
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use { 'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make' }}
    use 'simrat39/rust-tools.nvim'
    use 'williamboman/nvim-lsp-installer'

    -- Completion
    use 'hrsh7th/nvim-cmp'

    -- Syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use {
        'junegunn/fzf',
        run = './install --bin',
    }
    use {
        'ibhagwan/fzf-lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- Color
    use 'norcalli/nvim-colorizer.lua'

    -- Colorscheme
    use 'Shatur/neovim-ayu'

    -- Utility
    use {
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    }

    -- Tabline
    use {
        'romgrk/barbar.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- TODO: nvim-tree seems to not like working and causes errors with the autocommands. Fix when possible.
    -- File Explorer
    -- use {
        -- 'kyazdani42/nvim-tree.lua',
        -- requires = {
            -- 'kyazdani42/nvim-web-devicons',
        -- },
    -- }
end)
