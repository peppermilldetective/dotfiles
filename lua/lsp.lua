-- LSP configurations

local lsp = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

vim.lsp.set_log_level("debug")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, clsp in ipairs(servers) do
  lsp[clsp].setup { on_attach = on_attach }
end

-- TypeScript

lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = { usePlaceholders = true }
}

-- Rust

lsp.rust_analyzer.setup({
    capabilities=capabilities,
    on_attach=on_attach,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = true,
        update_in_insert = true,
    }
)

-- Show diagnostic popup on cursor hold
cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]

cmd [[autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }]]

-- CSharp (omnisharp)

local pid = vim.fn.getpid()

local omnisharp_bin = "C:\\lsp\\omnisharp\\OmniSharp.exe"

lsp.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
    ...
}

-- Lua (sumneko/lua-language-server)

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = 'C:/lsp/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server.exe"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Tree-sitter config
local ts = require'nvim-treesitter.configs'
ts.setup{
    ensure_installed = {
        'rust',
        'c_sharp',
        'c',
        'dart',
        'cpp',
        'bash',
        'html',
        'javascript',
        'css',
        'lua',
        'python',
        'scss',
        'typescript',
        'vue',
        'zig',
    },
    highlight = {
        enable = true
    }
}
