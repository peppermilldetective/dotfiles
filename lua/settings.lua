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

opt('b', 'swapfile', true)

-- global/"option" interface
opt('o', 'mouse', 'nv')

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
opt('o', 'updatetime', 200)
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
opt('o', 'undofile', true)

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

cmd 'let g:sandwich_no_default_key_mappings = 1'
cmd 'let g:operator_sandwich_no_default_key_mappings = 1'

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
