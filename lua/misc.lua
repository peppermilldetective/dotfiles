-- Used to store things that I'm not entirely sure where else they belong. Modularity!

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank { on_visual = false }' -- disabled in visual mode

-- rust-analyzer show inlay hints on new file
cmd "au InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs lua require'lsp_extensions'.inlay_hints{}"

-- nvim-tree auto open on vim start
cmd "au VimEnter * NvimTreeOpen"

-- nvim-compe setup

require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        spell = true;
        tags = true;
        snippets_nvim = true;
    };
}
