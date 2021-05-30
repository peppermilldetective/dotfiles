-- {{{{{{{ Settings }}}}}}}

-- Used as a workaround to deal with some strange behaviours (PR#13479 in neovim)

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    if scope ~= 'o' then scopes['o'][key] = value end
    scopes[scope][key] = value
end

-- Normal Things?
cmd 'syntax enable'
cmd 'filetype plugin indent on'

-- buffer options
opt('b', 'modeline', true)

opt('b', 'infercase', true)
opt('b', 'complete', '.,w,b')

opt('b', 'expandtab', true)
opt('b', 'softtabstop', 4)
opt('b', 'tabstop', 4)
opt('b', 'shiftwidth', 4)
opt('b', 'autoindent', true)
opt('b', 'smartindent', true)

opt('b', 'swapfile', false)

-- global/"option" interface
opt('o', 'mouse', 'a')

opt('o', 't_vb', '')
opt('o', 'hidden', true)

opt('o', 'termguicolors', true)
opt('o', 'guifont', 'FiraCode Nerd Font:h10')
opt('o', 'incsearch', true)
opt('o', 'magic', true)

opt('o', 'history', 2000)
opt('o', 'smarttab', true)
opt('o', 'shiftround', true)
opt('o', 'timeout', true)
opt('o', 'ttimeout', true)
opt('o', 'timeoutlen', 500)
opt('o', 'ttimeoutlen', 100)
opt('o', 'updatetime', 300)
opt('o', 'redrawtime', 1500)
opt('o', 'whichwrap', 'h,l,<,>,[,],~')
opt('o', 'splitright', true)
opt('o', 'switchbuf', 'useopen,vsplit')
opt('o', 'backspace', 'indent,eol,start')
opt('o', 'diffopt', 'filler,iwhite')
opt('o', 'completeopt', 'menuone,noselect,noinsert')
opt('o', 'makeprg', 'build.bat')
opt('o', 'shortmess', 'aoOIqc')
opt('o', 'scrolloff', 8)
opt('o', 'sidescrolloff', 5)
opt('o', 'ruler', true)
opt('o', 'showcmd', true)
opt('o', 'cmdheight', 2)
opt('o', 'laststatus', 2)

opt('o', 'errorbells', false)
opt('o', 'visualbell', false)

opt('o', 'backup', false)
opt('o', 'writebackup', false)
opt('o', 'undofile', false)

opt('o', 'hlsearch', false)

opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'wrapscan', true)
opt('o', 'wrap', false)

---- window

opt('w', 'nu', true)

opt('w', 'signcolumn', 'yes')

opt('w', 'term', 'xterm-256color')

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

-- nvim-tree settings
vim.g.nvim_tree_side = 'left' -- left by default
vim.g.nvim_tree_width = 40 -- 30 by default
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', '.cargo' } -- empty by default
vim.g.nvim_tree_gitignore = 1 -- 0 by default
vim.g.nvim_tree_auto_open = 1 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
vim.g.nvim_tree_quit_on_open = 0 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_hide_dotfiles = 0 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_tab_open = 1 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_width_allow_resize  = 1 -- 0 by default, will not resize the tree when opening a file
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
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE', 'cargo.toml' } -- List of filenames that gets highlighted with NvimTreeSpecialFile

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
