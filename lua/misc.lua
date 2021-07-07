-- Used to store things that I'm not entirely sure where else they belong. Modularity!

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank { on_visual = false }' -- disabled in visual mode

-- nvim-tree auto open on vim start
-- TODO: Figure out a different system that detects when a git commit is being edited.
-- cmd "au VimEnter * NvimTreeOpen"
