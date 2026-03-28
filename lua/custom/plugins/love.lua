-- using lazy.nvim
return {
    'S1M0N38/love2d.nvim',
    event = 'VeryLazy',
    version = '2.*',
    opts = {},
    keys = {
        { '<leader>v', ft = 'lua', desc = 'LÖVE' },
        { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = 'Run LÖVE' },
        { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = 'Stop LÖVE' },
        -- Thanks this: https://github.com/S1M0N38/love2d.nvim/issues/11#issuecomment-3856994362
        { '<leader>vl', '<cmd>lua vim.lsp.enable({ "lua_ls" }, false) vim.lsp.enable({ "lua_ls" })<cr>', ft = 'lua', desc = 'Restart LSP' },
    },
}
