local lsp_installer = require"nvim-lsp-installer"

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        },
        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",
            -- Keymap to install a server
            install_server = "i",
            -- Keymap to reinstall/update a server
            update_server = "u",
            -- Keymap to update all installed servers
            update_all_servers = "U",
            -- Keymap to uninstall a server
            uninstall_server = "X",
        },
    }
})

lsp_installer.on_server_ready(function(server)
    local opts = {}

    server:setup(opts)
end)

local lsp_installer_servers = require'nvim-lsp-installer.servers'

local server_available, requested_server = lsp_installer_servers.get_server("rust_analyzer")
if server_available then
    requested_server:on_ready(function ()
        local opts = {}
        requested_server:setup(opts)
    end)
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
    end
end

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "rust",
        "lua",
        "css",
        "javascript",
        "typescript",
        "vim"
    },
    sync_install = false,
}

require'navigator'.setup({
    debug = false, -- log output
    width = 0.62, -- valeu of cols
    height = 0.38, -- listview height
    preview_height = 0.38,
    preview_lines = 40, -- total lines in preview screen
    preview_lines_before = 5, -- lines before the highlight line
    default_mapping = false,
    keymaps = { -- e.g keymaps={{key = "GR", func = "references()"}, } this replace gr default mapping
        -- { key = 'gr', func = "require('navigator.reference').reference()" },
        -- { key = 'Gr', func = "require('navigator.reference').async_ref()" },
        { mode = 'i', key = '<M-k>', func = 'signature_help()' },
        { key = '<c-k>', func = 'signature_help()' },
        -- { key = 'g0', func = "require('navigator.symbols').document_symbols()" },
        -- { key = 'gW', func = "require('navigator.workspace').workspace_symbol()" },
        -- { key = '<c-]>', func = "require('navigator.definition').definition()" },
        -- { key = 'gD', func = "declaration({ border = 'rounded', max_width = 80 })" },
        -- { key = 'gp', func = "require('navigator.definition').definition_preview()" },
        -- { key = 'gT', func = "require('navigator.treesitter').buf_ts()" },
        -- { key = '<Leader>gT', func = "require('navigator.treesitter').bufs_ts()" },
        { key = 'K', func = 'hover({ popup_opts = { border = single, max_width = 80 }})' },
        -- { key = '<Space>ca', mode = 'n', func = "require('navigator.codeAction').code_action()" },
        -- { key = '<Space>cA', mode = 'v', func = 'range_code_action()' },
        -- { key = '<Leader>re', func = 'rename()' },
        { key = '<F2>', func = "require('navigator.rename').rename()" },
        { key = '<Leader>gi', func = 'incoming_calls()' },
        { key = '<Leader>go', func = 'outgoing_calls()' },
        -- { key = 'gi', func = 'implementation()' },
        -- { key = '<Space>D', func = 'type_definition()' },
        -- { key = 'gL', func = "require('navigator.diagnostics').show_diagnostics()" },
        -- { key = 'gG', func = "require('navigator.diagnostics').show_buf_diagnostics()" },
        -- { key = '<Leader>dt', func = "require('navigator.diagnostics').toggle_diagnostics()" },
        -- { key = ']d', func = "diagnostic.goto_next({ border = 'rounded', max_width = 80})" },
        -- { key = '[d', func = "diagnostic.goto_prev({ border = 'rounded', max_width = 80})" },
        -- { key = ']r', func = "require('navigator.treesitter').goto_next_usage()" },
        -- { key = '[r', func = "require('navigator.treesitter').goto_previous_usage()" },
        -- { key = '<C-LeftMouse>', func = 'definition()' },
        -- { key = 'g<LeftMouse>', func = 'implementation()' },
        -- { key = '<Leader>k', func = "require('navigator.dochighlight').hi_symbol()" },
        -- { key = '<Space>wa', func = "require('navigator.workspace').add_workspace_folder()" },
        -- { key = '<Space>wr', func = "require('navigator.workspace').remove_workspace_folder()" },
        -- { key = '<Space>ff', func = 'formatting()', mode = 'n' },
        -- { key = '<Space>ff', func = 'range_formatting()', mode = 'v' },
        -- { key = '<Space>wl', func = "require('navigator.workspace').list_workspace_folders()" },
        -- { key = '<Space>la', mode = 'n', func = "require('navigator.codelens').run_action()" },
    },
    external = nil, -- true: enable for goneovim multigrid otherwise false

    border = 'single', -- border style, can be one of 'none', 'single', 'double', "shadow"
    lines_show_prompt = 10, -- when the result list items number more than lines_show_prompt,
    -- fuzzy finder prompt will be shown
    combined_attach = 'both', -- both: use both customized attach and navigator default attach, mine: only use my attach defined in vimrc
    on_attach = function(client, bufnr)
        -- your on_attach will be called at end of navigator on_attach
    end,
    ts_fold = false,
    -- code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
    -- code_lens_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
    treesitter_analysis = true, -- treesitter variable context
    transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil to disable it
    lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
    -- setup here. if it is nil, navigator will not init signature help
    signature_help_cfg = nil, -- if you would like to init ray-x/lsp_signature plugin in navigator, pass in signature help
    lsp = {
        code_action = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
            virtual_text_icon = true,
        },
        code_lens_action = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
            virtual_text_icon = true,
        },
        format_on_save = false, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
        disable_format_cap = {}, -- a list of lsp disable file format (e.g. if you using efm or vim-codeformat etc), empty by default
        disable_lsp = {}, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
        code_lens = false,
        -- only want to enable one lsp server
        disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors
        diagnostic_load_files = false, -- lsp diagnostic errors list may contains uri that not opened yet set to true to load those files
        diagnostic_virtual_text = true, -- show virtual for diagnostic message
        diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
        diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- set to nil to disable, set to {'╍', 'ﮆ'} to enable diagnostic status in scroll bar area
        tsserver = {
            -- filetypes = {'typescript'} -- disable javascript etc,
            -- set to {} to disable the lspclient for all filetype
        },
        sumneko_lua = {
            -- sumneko_root_path = sumneko_root_path,
            -- sumneko_binary = sumneko_binary,
            -- cmd = {'lua-language-server'}
        },
        servers = {
            'rust_analyzer',
            'tsserver',
            'bashls',
            'dockerls',
            'sumneko_lua',
            'vimls',
            'html',
            'cssls',
            'clangd',
            'omnisharp'
        }, -- you can add additional lsp server so navigator will load the default for you
    },
    lsp_installer = true, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
    icons = {
        icons = true, -- set to false to use system default ( if you using a terminal does not have nerd/icon)
        -- Code action
        code_action_icon = " ",
        -- code lens
        code_lens_action_icon = '👓',
        -- Diagnostics
        diagnostic_head = ' ',
        diagnostic_err = '📛',
        diagnostic_warn = ' ',
        diagnostic_info = ' ',
        diagnostic_hint = ' ',

        diagnostic_head_severity_1 = '🈲',
        diagnostic_head_severity_2 = '☣️ ',
        diagnostic_head_severity_3 = ' ',
        diagnostic_head_description = '⇒',
        diagnostic_virtual_text = '■',
        diagnostic_file = '📝',
        -- Values
        value_changed = '▶',
        value_definition = '◯', -- it is easier to see than 🦕
        -- Treesitter
        match_kinds = {
            var = ' ', -- "👹", -- Vampaire
            method = 'ƒ ', --  "🍔", -- mac
            ['function'] = ' ', -- "🤣", -- Fun
            parameter = '  ', -- Pi
            associated = '🤝',
            namespace = '🚀',
            type = ' ',
            field = ' ',
        },
        treesitter_defult = '🌲',
    },
})


vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")
