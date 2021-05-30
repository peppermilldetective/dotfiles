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

    plugin_package = 'packer', -- The default package for plugins
    max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
    auto_clean = true, -- During sync(), remove unused plugins
    compile_on_sync = true, -- During sync(), run packer.compile()
    disable_commands = false, -- Disable creating commands
    opt_default = false, -- Default to using opt (as opposed to start) plugins
    transitive_opt = true, -- Make dependencies of opt plugins also opt by default
    transitive_disable = true, -- Automatically disable dependencies of disabled plugins
    auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
    git = {
        cmd = 'git', -- The base command for git operations
        subcommands = { -- Format strings for git subcommands
            update         = '-C %s pull --ff-only --progress --rebase=false',
            install        = 'clone %s %s --depth %i --no-single-branch --progress',
            fetch          = '-C %s fetch --depth 999999 --progress',
            checkout       = '-C %s checkout %s --',
            update_branch  = '-C %s merge --ff-only @{u}',
            current_branch = '-C %s branch --show-current',
            diff           = '-C %s log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
            diff_fmt       = '%%h %%s (%%cr)',
            get_rev        = '-C %s rev-parse --short HEAD',
            get_msg        = '-C %s log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
            submodules     = '-C %s submodule update --init --recursive --progress'
        },
        depth = 1, -- Git clone depth
        clone_timeout = 60, -- Timeout, in seconds, for git clones
    },
    display = {
        non_interactive = false, -- If true, disable display windows for all operations
        open_fn  = nil, -- An optional function to open a window for packer's display
        open_cmd = '65vnew [packer]', -- An optional command to open a window for packer's display
        working_sym = '⟳', -- The symbol for a plugin being installed/updated
        error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
        done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
        removed_sym = '-', -- The symbol for an unused plugin which was removed
        moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
        header_sym = '━', -- The symbol for the header line in packer's display
        show_all_info = true, -- Should packer show all update details automatically?
        keybindings = { -- Keybindings for the display window
            quit = 'q',
            toggle_info = '<CR>',
            prompt_revert = 'r',
        }
    },
    luarocks = {
        python_cmd = 'python' -- Set the python command to use for running hererocks
    },
    profile = {
        enable = false,
        threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
    }
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

    use 'Yggdroot/indentLine'
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

    use { 'nvim-treesitter/nvim-treesitter', run = function() fn['TSUpdate']() end }

    use 'hrsh7th/nvim-compe'

    -- Navigation Plugins

    use { 'junegunn/fzf', run = function() fn['fzf#install']() end }
    use 'junegunn/fzf.vim'

    use 'pechorin/any-jump.vim'
    use 'kyazdani42/nvim-tree.lua'

    -- Formatting Plugins

    use 'machakann/vim-sandwich'
    use 'bfrg/vim-cpp-modern'
end)
