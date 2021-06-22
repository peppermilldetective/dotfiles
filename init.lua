-- Declare globals for interfacing with the vim api.
cmd = vim.cmd
fn = vim.fn
g = vim.g
set = vim.o

-- Important settings first
vim.opt.shadafile = "NONE"
g.loaded_gzip = false
g.loaded_tarPlugin = false
g.loaded_zipPlugin = false
g.loaded_man = false
g.loaded_2html_plugin = false
g.loaded_remote_plugins = false

-- Import the various custom scripts.
require('plugins')

require("colorscheme")
require("keybinds")
require("lsp")
require("settings")
require("statusline")
require("misc")

-- Adds transparency to nvim based on terminal settings
-- Has to be the last thing executed because some later setting is preventing it from being properly set.
cmd 'highlight Normal ctermbg=none'
cmd 'highlight NonText ctermbg=none'
cmd 'highlight Normal guibg=none'
cmd 'highlight NonText guibg=none'
