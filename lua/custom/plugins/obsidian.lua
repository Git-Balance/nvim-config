--vim.keymap.set('n', '<leader>on', obsidian.Client.create_note(), { desc = '[S]earch [H]elp' })

-- Automatically pick the first directory that exists
function SelectWorkspace(directoriesToCheck)
    for _, value in pairs(directoriesToCheck) do
        if vim.fn.isdirectory(value) ~= 0 then
            return value
        end
    end
end

return {
    'obsidian-nvim/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        -- Required.
        'nvim-lua/plenary.nvim',

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = 'School 10 Vault',
                path = SelectWorkspace {
                    '~/Documents/Scripts/',
                    'C:/Users/csbon/OneDrive/Documents/School 10 Vault/',
                },
            },
            {
                name = 'personal',
                path = '~/vaults/personal',
            },
        },

        -- see below for full list of options 👇
        note_id_func = function(title)
            return title
        end,
        ---@return table
        note_frontmatter_func = function(note)
            -- Add the title of the note as an alias.
            if note.title then
                note:add_alias(note.title)
            end

            local out = { tags = note.tags, aliases = note.aliases }

            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            return out
        end,
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = 'Daily',
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = '%y-%m-%d',
            -- Optional, if you want to change the date format of the default alias of daily notes.
            --alias_format = "%B %-d, %Y",
            -- Optional, default tags to add to each new daily note created.
            default_tags = { 'daily/note' },
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            --template = nil
        },

        new_notes_location = 'current_dir',

        -- WARNING: Commands like ":ObsidianNew" won't be supported in the future
        -- For some reason, you are getting a warning despite fixing it...
        -- Oh no
        legacy_commands = false,
    },
    keys = {
        { '<leader>on', ':Obsidian new<CR>', desc = 'New', silent = true },
        { '<leader>oq', ':Obsidian quick_switch<CR>', desc = 'Quick switch', silent = true },
        { '<leader>ot', ':Obsidian tags<CR>', desc = 'Tags', silent = true },
    },
}
