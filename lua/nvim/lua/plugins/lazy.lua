return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        color_overrides = {
          mocha = {
            rosewater = "#ffc6be",
            flamingo = "#fb4934",
            pink = "#ff75a0",
            mauve = "#d3869b",
            red = "#f2594b",
            maroon = "#fe8019",
            peach = "#FFAD7D",
            yellow = "#DEB22C", --  "#d79921"
            green = "#a9b665",
            teal = "#8ec07c",
            sky = "#7daea3",
            sapphire = "#689d6a",
            blue = "#7ba2c9",
            lavender = "#6b77e3",
            text = "#fbf1c7",     -- #D4BE98  #C6D0F5
            subtext1 = "#d5c4a1", -- #BDAE8B  #B3BCDF
            subtext0 = "#a89984", -- #A69372  #A1A8C9
            overlay2 = "#8C7A58", -- #8E95B3
            overlay1 = "#735F3F", -- #7B819D
            overlay0 = "#806234", -- #696D86
            surface2 = "#665c54", -- #6E7477  #4B4F51  #565970
            surface1 = "#3c3836", -- #2A2D2E           #43465A
            surface0 = "#32302f", -- #232728           #313244
            base = "#1B2021",     -- #1D2021   #282828        #1E1E2E
            mantle = "#1d2021",   -- #191C1D           #181825
            crust = "#1b1b1b",    --                   #11111B
          }
        }
      });
    end
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    }
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup();
    end
  },
  {
    'jakewvincent/mkdnflow.nvim',
    rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    config = function()
      -- ** DEFAULT SETTINGS; TO USE THESE, PASS NO ARGUMENTS TO THE SETUP FUNCTION **
      require('mkdnflow').setup({
        modules = {
          bib = true,
          buffers = true,
          conceal = true,
          cursor = true,
          folds = false,
          links = true,
          lists = true,
          maps = true,
          paths = true,
          tables = true,
          yaml = false,
          cmp = true,
        },
        filetypes = { md = true, rmd = true, markdown = true },
        create_dirs = true,
        perspective = {
          priority = 'first',
          fallback = 'current',
          root_tell = false,
          nvim_wd_heel = false,
          update = false
        },
        wrap = false,
        bib = {
          default_path = nil,
          find_in_root = true
        },
        silent = false,
        links = {
          style = 'markdown',
          name_is_source = false,
          conceal = false,
          context = 0,
          implicit_extension = nil,
          transform_implicit = false,
          transform_explicit = function(text)
            text = text:gsub(" ", "-")
            text = text:lower()
            text = os.date('%Y-%m-%d_') .. text
            return (text)
          end
        },
        new_file_template = {
          use_template = false,
          placeholders = {
            before = {
              title = "link_title",
              date = "os_date"
            },
            after = {}
          },
          template = "# {{ title }}"
        },
        to_do = {
          symbols = { ' ', '-', 'X' },
          update_parents = true,
          not_started = ' ',
          in_progress = '-',
          complete = 'X'
        },
        tables = {
          trim_whitespace = true,
          format_on_move = true,
          auto_extend_rows = false,
          auto_extend_cols = false
        },
        yaml = {
          bib = { override = false }
        },
        mappings = {
          MkdnEnter = { { 'n', 'v' }, '<CR>' },
          MkdnTab = false,
          MkdnSTab = false,
          MkdnNextLink = { 'n', '<Tab>' },
          MkdnPrevLink = { 'n', '<S-Tab>' },
          MkdnNextHeading = { 'n', ']]' },
          MkdnPrevHeading = { 'n', '[[' },
          MkdnGoBack = { 'n', '<BS>' },
          MkdnGoForward = { 'n', '<Del>' },
          MkdnCreateLink = false,                                      -- see MkdnEnter
          MkdnCreateLinkFromClipboard = { { 'n', 'v' }, '<leader>p' }, -- see MkdnEnter
          MkdnFollowLink = false,                                      -- see MkdnEnter
          MkdnDestroyLink = { 'n', '<M-CR>' },
          MkdnTagSpan = { 'v', '<M-CR>' },
          MkdnMoveSource = { 'n', '<F2>' },
          MkdnYankAnchorLink = { 'n', 'yaa' },
          MkdnYankFileAnchorLink = { 'n', 'yfa' },
          MkdnIncreaseHeading = { 'n', '+' },
          MkdnDecreaseHeading = { 'n', '-' },
          MkdnToggleToDo = { { 'n', 'v' }, '<C-Space>' },
          MkdnNewListItem = false,
          MkdnNewListItemBelowInsert = { 'n', 'o' },
          MkdnNewListItemAboveInsert = { 'n', 'O' },
          MkdnExtendList = false,
          MkdnUpdateNumbering = { 'n', '<leader>nn' },
          MkdnTableNextCell = { 'i', '<Tab>' },
          MkdnTablePrevCell = { 'i', '<S-Tab>' },
          MkdnTableNextRow = false,
          MkdnTablePrevRow = { 'i', '<M-CR>' },
          MkdnTableNewRowBelow = { 'n', '<leader>ir' },
          MkdnTableNewRowAbove = { 'n', '<leader>iR' },
          MkdnTableNewColAfter = { 'n', '<leader>ic' },
          MkdnTableNewColBefore = { 'n', '<leader>iC' },
          MkdnFoldSection = { 'n', '<leader>f' },
          MkdnUnfoldSection = { 'n', '<leader>F' }
        }
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require 'window-picker'.setup({
        -- type of hints you want to get
        -- following types are supported
        -- 'statusline-winbar' | 'floating-big-letter'
        -- 'statusline-winbar' draw on 'statusline' if possible, if not 'winbar' will be
        -- 'floating-big-letter' draw big letter on a floating window
        -- used
        hint = 'statusline-winbar',

        -- when you go to window selection mode, status bar will show one of
        -- following letters on them so you can use that letter to select the window
        selection_chars = 'FJDKSLA;CMRUEIWOQP',

        -- This section contains picker specific configurations
        picker_config = {
          statusline_winbar_picker = {
            -- You can change the display string in status bar.
            -- It supports '%' printf style. Such as `return char .. ': %f'` to display
            -- buffer file path. See :h 'stl' for details.
            selection_display = function(char, windowid)
              return '%=' .. char .. '%='
            end,

            -- whether you want to use winbar instead of the statusline
            -- "always" means to always use winbar,
            -- "never" means to never use winbar
            -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
            use_winbar = 'never', -- "always" | "never" | "smart"
          },

          floating_big_letter = {
            -- window picker plugin provides bunch of big letter fonts
            -- fonts will be lazy loaded as they are being requested
            -- additionally, user can pass in a table of fonts in to font
            -- property to use instead

            font = 'ansi-shadow', -- ansi-shadow |
          },
        },

        -- whether to show 'Pick window:' prompt
        show_prompt = true,

        -- prompt message to show to get the user input
        prompt_message = 'Pick window: ',

        -- if you want to manually filter out the windows, pass in a function that
        -- takes two parameters. You should return window ids that should be
        -- included in the selection
        -- EX:-
        -- function(window_ids, filters)
        --    -- folder the window_ids
        --    -- return only the ones you want to include
        --    return {1000, 1001}
        -- end
        filter_func = nil,

        -- following filters are only applied when you are using the default filter
        -- defined by this plugin. If you pass in a function to "filter_func"
        -- property, you are on your own
        filter_rules = {
          -- when there is only one window available to pick from, use that window
          -- without prompting the user to select
          autoselect_one = true,

          -- whether you want to include the window you are currently on to window
          -- selection or not
          include_current_win = false,

          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { 'NvimTree', 'neo-tree', 'notify' },

            -- if the file type is one of following, the window will be ignored
            buftype = { 'terminal' },
          },

          -- filter using window options
          wo = {},

          -- if the file path contains one of following names, the window
          -- will be ignored
          file_path_contains = {},

          -- if the file name contains one of following names, the window will be
          -- ignored
          file_name_contains = {},
        },

        -- You can pass in the highlight name or a table of content to set as
        -- highlight
        highlights = {
          statusline = {
            focused = {
              fg = '#ededed',
              bg = '#e35e4f',
              bold = true,
            },
            unfocused = {
              fg = '#ededed',
              bg = '#6E7477',
              bold = true,
            },
          },
          winbar = {
            focused = {
              fg = '#ededed',
              bg = '#e35e4f',
              bold = true,
            },
            unfocused = {
              fg = '#ededed',
              bg = '#44cc41',
              bold = true,
            },
          },
        },
      })
    end,
  }
}
