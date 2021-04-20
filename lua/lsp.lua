-- LSP configurations

local lsp = require'lspconfig'
local lspfuzzy = require'lspfuzzy'

lspfuzzy.setup{}

local on_attach = function(client)
    require'completion'.on_attach(client)
end

local pid = vim.fn.getpid()
local omnisharp_bin = 'E:/LSP/omnisharp-win-x64/OmniSharp.exe'
lsp.omnisharp.setup{
    cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) };
}

lsp.rust_analyzer.setup{
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
        }
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

-- TODO: Fix tree sitter to actually work
-- Tree-sitter config
-- local ts = require'nvim-treesitter.configs'
-- ts.setup{ensure_installed = 'maintained', highlight = {enable = true}}

-- require'nvim-treesitter.install'.compilers = { "clang" }

