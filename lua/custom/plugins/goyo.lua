return {
    'junegunn/goyo.vim',
    config = function()
        vim.g.goyo_width = 80
        vim.api.nvim_create_autocmd('User', {
            pattern = 'GoyoEnter',
            callback = function()
                if not (vim.env.TMUX == nil) then
                    vim.cmd [[
                        silent !tmux set status off
                        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
                    ]]
                end
            end,
        })
        vim.api.nvim_create_autocmd('User', {
            pattern = 'GoyoLeave',
            callback = function()
                if not (vim.env.TMUX == nil) then
                    vim.cmd [[
                        silent !tmux set status on
                        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
                    ]]
                end
            end,
        })
    end,
    keys = {
        {
            '<leader>z',
            '<cmd>Goyo<CR>',
            desc = 'Goyo',
        },
    },
}
