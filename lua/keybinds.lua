-- Key mappings

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- set leader
vim.g.mapleader = ';'

-- General Purpose Keybinds
map('n', '<leader>n', ':bn<Enter>')
map('n', '<leader>N', ':bp<Enter>')
map('n', '<leader>q', ':bd<Enter>')

map('n', '<leader>c', '"+y')
map('n', '<leader>p', '"+p')
map('v', '<leader>c', '"+y')
map('v', '<leader>p', '"+p')

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

map('n', '<C-p>', ':Files<Enter>')
map('n', '<C-o>', ':Rg<Enter>')
map('n', '<leader>*', ':Rg  <C-r>"<Enter>')

-- Mappings for vim-sandwich to prevent using 's'
map('n', '<leader>sd', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)')
map('n', '<leader>sr', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)')
map('n', '<leader>sdb', '<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)')
map('n', '<leader>srb', '<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)')

map('n', '<leader>sa', '<Plug>(operator-sandwich-add)')

map('x', '<leader>sd', '<Plug>(operator-sandwich-delete)')
map('x', '<leader>sr', '<Plug>(operator-sandwich-replace)')

-- LSP Keybinds can be found in lsp.lua

-- nvim-compe keybinds

map('n', '<C-Space>', 'compe#complete()')
map('n', '<CR>', 'pumvisible() ? compe#confirm("<CR>") : "\\<CR>"', {expr = true})
map('n', '<C-e>', 'pumvisible() ? compe#close("<C-e>") : "\\<C-e>"', {expr = true})
map('n', '<C-f>', 'pumvisible() ? compe#scroll({ "delta": +4 }) : "\\<C-f>"', {expr = true})
map('n', '<C-d>', 'pumvisible() ? compe#scroll({ "delta": -4 }) : "\\<C-f>"', {expr = true})
