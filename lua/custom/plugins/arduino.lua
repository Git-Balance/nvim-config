return {
    'stevearc/vim-arduino',
    version = '*',
    keys = {
        -- { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
        { '<leader>aa', '<cmd>ArduinoAttach<CR>', desc = 'Attach' },
        { '<leader>av', '<cmd>ArduinoVerify<CR>', desc = 'Verify' },
        { '<leader>au', '<cmd>ArduinoUpload<CR>', desc = 'Upload' },
        { '<leader>aus', '<cmd>ArduinoUploadAndSerial<CR>', desc = 'Upload and Serial' },
        { '<leader>as', '<cmd>ArduinoSerial<CR>', desc = 'Serial' },
        { '<leader>ab', '<cmd>ArduinoChooseBoard<CR>', desc = 'Choose board' },
        { '<leader>ap', '<cmd>ArduinoChooseProgrammer<CR>', desc = 'Choose programmer' },
    },
}
