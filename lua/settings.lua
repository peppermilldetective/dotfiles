-- {{{{{{{ Settings }}}}}}}

-- Used as a workaround to deal with some strange behaviours (PR#13479 in neovim)

local opt = vim.opt

-- Normal Things?
cmd 'syntax enable'
cmd 'filetype plugin indent on'

opt.infercase = true

opt.expandtab = true
opt.softtabstop = 4
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true

-- required for nvim-compe
opt.completeopt = 'menuone,noselect,noinsert'

opt.swapfile = false

opt.mouse = 'a'

opt.hidden = true

opt.termguicolors = true
opt.guifont = 'FiraCode Nerd Font:h10'
opt.incsearch = true
opt.magic = true

opt.history = 2000
opt.smarttab = true
opt.shiftround = true
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500
opt.ttimeoutlen = 100
opt.updatetime = 300
opt.redrawtime = 1500
opt.whichwrap = 'h,l,<,>,[,],~'
opt.splitright = true
opt.switchbuf = 'useopen,vsplit'
opt.backspace = 'indent,eol,start'
opt.diffopt = 'filler,iwhite'
opt.makeprg = 'build.bat'
opt.shortmess = 'aoOIqc'
opt.scrolloff = 8
opt.sidescrolloff = 5
opt.ruler = true
opt.showcmd = true
opt.cmdheight = 2
opt.laststatus = 2

opt.errorbells = false
opt.visualbell = false

opt.backup = false
opt.writebackup = false
opt.undofile = false

opt.hlsearch = false

opt.ignorecase = true
opt.smartcase = true
opt.wrap = false

opt.nu = true
opt.signcolumn = 'yes'

-- Strictly a window option.
vim.wo.term = 'xterm-256color'

---- Plugin settings?

vim.g.sandwich_no_default_key_mappings = 1
vim.g.operator_sandwich_no_default_key_mappings = 1

vim.g.gitgutter_git_executable = 'C:\\Program Files\\Git\\bin\\git.exe'

-- If using wildmenu, need to ignore some extra stuff

if vim.fn.has('wildmenu') then
    set.wildignorecase = true
    set.wildignore = vim.o.wildignore .. '.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*,*.exe'
    set.wildignore = vim.o.wildignore .. '*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store'
    set.wildignore = vim.o.wildignore .. '**/node_modules/**,**/bower_modules/**,*/.sass-cache/*'
    set.wildignore = vim.o.wildignore .. 'application/vendor/**,**/vendor/ckeditor/**,media/vendor/**'
    set.wildignore = vim.o.wildignore .. '__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**'
end

if vim.fn.executable('rg') then
    set.grepformat = '%f:%l:%m'
    set.grepprg = 'rg --vimgrep' .. (vim.o.smartcase and ' --smartcase' or '')
end

-- nvim-compe settings

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'disable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    tags = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    nvim_treesitter = true;
  };
}

-- nvim-tree settings
vim.g.nvim_tree_side = 'left' -- left by default
vim.g.nvim_tree_width = 40 -- 30 by default
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', '.cargo' } -- empty by default
vim.g.nvim_tree_gitignore = 0 -- 0 by default
vim.g.nvim_tree_auto_open = 0 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_hide_dotfiles = 0 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_tab_open = 0 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_width_allow_resize  = 0 -- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_disable_netrw = 0 -- 1 by default, disables netrw
vim.g.nvim_tree_hijack_netrw = 0 -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_lsp_diagnostics = 1 -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
vim.g.nvim_tree_disable_window_picker = 1 -- 0 by default, will disable the window picker.
vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
        'packer',
        'qf'
    },
    buftype = {
        'terminal'
    }
}

-- Dictionary of buffer option names mapped to a list of option values that
-- indicates to the window picker that the buffer's window should not be
-- selectable.
vim.g.nvim_tree_special_files = { -- List of filenames that gets highlighted with NvimTreeSpecialFile
    'README.md',
    'Makefile',
    'MAKEFILE',
    'cargo.toml'
}

-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
    lsp = {
        hint = "",
        info = "",
        warning = "",
        error = "",
    }
}
-- NvimTreeOpen and NvimTreeClose are also available if you need them

-- set termguicolors this variable must be enabled for colors to be applied properly

-- a list of groups can be found at `:help nvim_tree_highlight`
-- highlight NvimTreeFolderIcon guibg=blue

-- telescope.nvim

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
