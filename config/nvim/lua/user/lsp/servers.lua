local servers = {
    sumneko_lua = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim", "mp" },
                },
            },
        },
    },
    -- c/c++
    ccls = {
		filetypes = { "c", "cpp", "objc", "pbjcpp" },
		root_dir = function()
				return vim.fn.getcwd()
		end,
		autostart = true,
		single_file_support = true,
    },
    -- also:
    -- for zk see lua/user/plugins/zk.lua
    -- for null-ls see lua/user/plugins/null-ls.lua
}

return servers
