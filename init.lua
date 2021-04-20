-- Declare globals for interfacing with the vim api.
cmd = vim.cmd
fn = vim.fn
g = vim.g
set = vim.o

-- Import the various custom scripts.
require('plugins')

require("colorscheme")
require("keybinds")
require("lsp")
require("settings")
require("statusline")
require("misc")
