-- Plugins

-- Enable plugin manager as a global. Allows the scripts to add plugins as needed.
cmd 'packadd paq-nvim'
paq = require'paq-nvim'.paq
paq{'savq/paq-nvim', opt=true}

-- Colorscheme/Visual plugins

paq 'itchyny/vim-gitbranch'
paq 'kyazdani42/nvim-web-devicons'
paq 'rafi/awesome-vim-colorschemes'
paq{'kaicataldo/material.vim', branch = 'main'}

paq 'Yggdroot/indentLine'
paq 'lukas-reineke/indent-blankline.nvim'

-- LSP Plugins

paq 'neovim/nvim-lspconfig'
paq 'nvim-lua/lsp_extensions.nvim'
paq 'nvim-lua/completion-nvim'
paq 'ojroques/nvim-lspfuzzy'

-- Navigation Plugins

paq{'junegunn/fzf', hook = fn['fzf#install']}
paq 'junegunn/fzf.vim'

paq 'pechorin/any-jump.vim'

paq 'kyazdani42/nvim-tree.lua'

-- Formatting Plugins

paq 'machakann/vim-sandwich'
paq 'bfrg/vim-cpp-modern'

