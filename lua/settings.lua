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

-- telescope settings
require'telescope'.setup {
    defaults = {
        file_ignore_patterns = {
            '%.exe',
            '%.pdb',
            '%.ilk',
            'target/*',
            '%.env'
        },
        mappings = {
            i = {
                ["<esc>"] = require'telescope.actions'.close
            },
        },
    }
}

-- Nvim-Tree settings
-- vim.g.nvim_tree_side = 'left' -- left by default
-- vim.g.nvim_tree_width = 40 -- 30 by default
-- vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } -- empty by default, don't auto open tree on specific filetypes.
-- vim.g.nvim_tree_quit_on_open = 1 -- 0 by default, closes the tree when you open a file
-- vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
-- vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
-- vim.g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
-- vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
-- vim.g.nvim_tree_width_allow_resize  = 0 -- 0 by default, will not resize the tree when opening a file
-- vim.g.nvim_tree_add_trailing = 1 -- 0 by default, append a trailing slash to folder names
-- vim.g.nvim_tree_group_empty = 1 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
-- vim.g.nvim_tree_disable_window_picker = 1 -- 0 by default, will disable the window picker.
-- vim.g.nvim_tree_window_picker_exclude = {
--     filetype = {
--         'packer',
--         'qf'
--     },
--     buftype = {
--         'terminal'
--     }
-- }
-- 
-- -- Dictionary of buffer option names mapped to a list of option values that
-- -- indicates to the window picker that the buffer's window should not be
-- -- selectable.
-- vim.g.nvim_tree_special_files = { -- List of filenames that gets highlighted with NvimTreeSpecialFile
--     'README.md',
--     'Makefile',
--     'MAKEFILE',
--     'cargo.toml'
-- }
-- 
-- -- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- -- 1 by default, notice that if 'files' is 1, it will only display
-- -- if nvim-web-devicons is installed and on your runtimepath
-- vim.g.nvim_tree_show_icons = {
--     git = 1,
--     folders = 1,
--     files = 1,
-- }
-- 
-- -- default will show icon by default if no icon is provided
-- -- default shows no icon by default
-- vim.g.nvim_tree_icons = {
--     default = '',
--     symlink = '',
--     git = {
--         unstaged = "✗",
--         staged = "✓",
--         unmerged = "",
--         renamed = "➜",
--         untracked = "★",
--         deleted = "",
--         ignored = "◌"
--     },
--     folder = {
--         default = "",
--         open = "",
--         empty = "",
--         empty_open = "",
--         symlink = "",
--         symlink_open = "",
--     },
--     lsp = {
--         hint = "",
--         info = "",
--         warning = "",
--         error = "",
--     }
-- }
-- 
-- require'nvim-tree'.setup {
--     disable_netrw       = true,
--     hijack_netrw        = true,
--     open_on_setup       = true,
--     ignore_ft_on_setup  = {},
--     auto_close          = false,
--     open_on_tab         = false,
--     hijack_cursor       = false,
--     update_cwd          = false,
--     update_to_buf_dir   = {
--         enable = true,
--         auto_open = true,
--     },
--     diagnostics = {
--         enable = true,
--         icons = {
--             hint = "",
--             info = "",
--             warning = "",
--             error = "",
--         }
--     },
--     update_focused_file = {
--         enable      = true,
--         update_cwd  = false,
--         ignore_list = {}
--     },
--     system_open = {
--         cmd  = nil,
--         args = {}
--     },
--     filters = {
--         dotfiles = false,
--         custom = {
--             '.git',
--             'node_modules',
--             '.cache',
--             '.cargo'
--         }
--     },
--     git = {
--         enable = true,
--         ignore = true,
--         timeout = 500,
--     },
--     view = {
--         width = 30,
--         height = 30,
--         hide_root_folder = false,
--         side = 'left',
--         auto_resize = false,
--         mappings = {
--             custom_only = false,
--             list = {}
--         },
--         number = false,
--         relativenumber = false,
--         signcolumn = "yes"
--     },
--     trash = {
--         cmd = "trash",
--         require_confirm = true
--     }
-- }
