-- Key mappings

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- set leader
vim.g.mapleader = ';'

map('n', '<leader>n', ':bn<Enter>')
map('n', '<leader>N', ':bp<Enter>')
map('n', '<leader>q', ':bd<Enter>')

map('', '<leader>c', '"+y')
map('', '<leader>p', '"+p')

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})

map('i', '<Tab>', '<Plug>(completion_smart_tab)')
map('i', '<S-Tab>', '<Plug>(completion_smart_s_tab)')

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
