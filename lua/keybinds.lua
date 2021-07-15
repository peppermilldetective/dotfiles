-- Key mappings

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- set leader
g.mapleader = ';'

-- General Purpose Keybinds
map('n', '<leader>n', ':BufferNext<Enter>')
map('n', '<leader>N', ':BufferPrevious<Enter>')
map('n', '<leader>q', ':BufferClose<Enter>')

map('n', '<leader>w', ':w<CR>')

map('n', '<leader>c', '"+y')
map('n', '<leader>p', '"+p')
map('v', '<leader>c', '"+y')
map('v', '<leader>p', '"+p')

map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})

map('n', '<C-p>', '<cmd>Telescope find_files<cr>')
map('n', '<C-o>', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>*', ':Rg  <C-r>"<Enter>')

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

-- lspsaga commands
map('n', 'gD', '<Cmd>lua require"lspsaga.provider".preview_definition()<CR>')
map('n', 'gh', '<cmd>lua require"lspsaga.provider".lsp_finder()<CR>')
map('n', 'gs', '<cmd>lua require"lspsaga.signaturehelp".signature_help()<CR>')
map('n', '<F2>', '<cmd>lua require"lspsaga.rename".rename()<CR>')
map('n', '<leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>')
map('v', '<leader>ca', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>')
map('n', '<leader>cc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>')
map('n', '<A-t>', '<cmd>lua require"lspsaga.floaterm".open_float_terminal()<CR>')
map('t', '<A-t>', '<cmd>lua require"lspsaga.floaterm".close_float_terminal()<CR>')

-- builtin nvim-lsp(config?) commands
-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gc', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

-- telescope commands
map('n', '<leader>s', '<cmd>lua require"telescope.builtin".lsp_document_symbols()<CR>')

-- git commands via Telescope
map('n', '<leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<CR>')
map('n', '<leader>gC', '<cmd>lua require("telescope.builtin").git_bcommits()<CR>')
map('n', '<leader>gb', '<cmd>lua require"telescope.builtin".git_branches()<CR>')
map('n', '<leader>gs', '<cmd>lua require"telescope.builtin".git_status()<CR>')

-- other telescope functions
map('n', '<leader>m', '<cmd>lua require"telescope.builtin".marks()<CR>')
map('n', '<leader>r', '<cmd>lua require"telescope.builtin".registers()<CR>')
map('n', '<leader>vo', '<cmd>lua require"telescope.builtin".vim_options()<CR>')

map('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')
map('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
map('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')

-- Goto previous/next diagnostic warning/error
map('n', 'g[', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>')
map('n', 'g]', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>')

-- barbar keybinds
map('n', '<leader>b', ':BufferPick<CR>')
