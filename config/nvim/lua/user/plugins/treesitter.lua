
local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
    refactor = {
        highlight_current_scope = {
            enable = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        highlight_definitions = {
            enable = true,
            updatetime = 10,
            clear_on_cursor_move = false,
        },
        navigation = {
          enable = true,
          keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
}

