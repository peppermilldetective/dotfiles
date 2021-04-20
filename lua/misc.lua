-- Used to store things that I'm not entirely sure where else they belong. Modularity!

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank { on_visual = false }' -- disabled in visual mode
