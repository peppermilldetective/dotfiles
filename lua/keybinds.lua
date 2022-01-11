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

map('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_ivy({}))<cr>')
map('n', '<C-o>', '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_ivy({}))<cr>')
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

-- builtin nvim-lsp(config?) commands
-- See `:help vim.lsp.*` for documentation on any of the below functions
map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gc', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

-- Telescope lsp commands
map('n', 'gD', '<Cmd>lua require"telescope.builtin".lsp_definitions(require"telescope.themes".get_cursor({}))<CR>')
map('n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references(require"telescope.themes".get_cursor({}))<CR>')
map('n', '<leader>ca', '<cmd>lua require("telescope.builtin").lsp_code_actions(require("telescope.themes").get_cursor({}))<CR>')
-- TODO: find range code actions map('v', '<leader>ca', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>')
-- TODO: find diagnostics for current line.
map('n', '<leader>cc', '<cmd>lua require("telescope.builtin").diagnostics(bufnr=0, require("telescope.themes").get_ivy({}))<CR>')

map('n', '<leader>s', '<cmd>lua require"telescope.builtin".lsp_document_symbols(require("telescope.themes").get_ivy({}))<CR>')

-- git commands via Telescope
map('n', '<leader>gc', '<cmd>lua require("telescope.builtin").git_commits(require("telescope.themes").get_ivy({}))<CR>')
map('n', '<leader>gC', '<cmd>lua require("telescope.builtin").git_bcommits(require("telescope.themes").get_ivy({}))<CR>')
map('n', '<leader>gb', '<cmd>lua require"telescope.builtin".git_branches(require("telescope.themes").get_ivy({}))<CR>')
map('n', '<leader>gs', '<cmd>lua require"telescope.builtin".git_status(require("telescope.themes").get_ivy({}))<CR>')

-- other telescope functions
map('n', '<leader>m', '<cmd>lua require"telescope.builtin".marks(require("telescope.themes").get_ivy({}))<CR>')
map('n', '<leader>r', '<cmd>lua require"telescope.builtin".registers(require("telescope.themes").get_ivy({}))<CR>')
map('n', '<leader>vo', '<cmd>lua require"telescope.builtin".vim_options(require("telescope.themes").get_ivy({}))<CR>')

-- Goto previous/next diagnostic warning/error
map('n', 'g[', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>')
map('n', 'g]', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>')

-- barbar keybinds
map('n', '<leader>b', ':BufferPick<CR>')
