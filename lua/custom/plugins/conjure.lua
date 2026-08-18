return {
    {
        'Olical/conjure',
        ft = { 'clojure', 'fennel', 'python', 'scheme' }, -- etc
        lazy = true,
        init = function()
            -- Set configuration options here
            -- Uncomment this to get verbose logging to help diagnose internal Conjure issues
            -- This is VERY helpful when reporting an issue with the project
            -- vim.g["conjure#debug"] = true

            -- Use guile scheme instead of mit-scheme
            vim.g['conjure#filetype#scheme'] = 'conjure.client.guile.socket'
            vim.g['conjure#client#guile#socket#pipename'] = '/tmp/guile-repl.socket'
        end,

        -- Optional cmp-conjure integration
        dependencies = { 'PaterJason/cmp-conjure' },
        keys = {
            { '<localleader>cg', '<cmd>:terminal guile-repl.sh<cr>', ft = 'scheme', desc = 'Start guile repl server' }, -- Requires path_scripts
        },
    },
    {
        'PaterJason/cmp-conjure',
        lazy = true,
        config = function()
            local cmp = require 'cmp'
            local config = cmp.get_config()
            table.insert(config.sources, { name = 'conjure' })
            config.mapping = {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm { select = true },
            }
            return cmp.setup(config)
        end,
    },
}
-- keys = {
--     { '<leader>v', ft = 'lua', desc = 'LÖVE' },
--     { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = 'Run LÖVE' },
--     { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = 'Stop LÖVE' },
--     -- Thanks this: https://github.com/S1M0N38/love2d.nvim/issues/11#issuecomment-3856994362
--     { '<leader>vl', '<cmd>lua vim.lsp.enable({ "lua_ls" }, false) vim.lsp.enable({ "lua_ls" })<cr>', ft = 'lua', desc = 'Restart LSP' },
-- },
