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

-- nvim-compe keybinds

map('n', '<C-Space>', 'compe#complete()')
map('n', '<CR>', 'pumvisible() ? compe#confirm("<CR>") : "\\<CR>"', {expr = true})
map('n', '<C-e>', 'pumvisible() ? compe#close("<C-e>") : "\\<C-e>"', {expr = true})
map('n', '<C-f>', 'pumvisible() ? compe#scroll({ "delta": +4 }) : "\\<C-f>"', {expr = true})
map('n', '<C-d>', 'pumvisible() ? compe#scroll({ "delta": -4 }) : "\\<C-f>"', {expr = true})

-- nvim-tree keybinds

map('n', '<leader>t', ':NvimTreeToggle<CR>')
map('n', '<leader>f', ':NvimTreeFindFile<CR>')

-- nvim LSP Keybinds

-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'gc', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

-- Goto previous/next diagnostic warning/error
map('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')

map('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
