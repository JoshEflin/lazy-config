local builtin = require('telescope.builtin')

-- Define key mappings using vim.api.nvim_set_keymap
vim.keymap.set('n', '<leader>pf', function() builtin.find_files() end)
vim.keymap.set('n', '<leader>vf', function()
    builtin.find_files {
        cwd = vim.fn.stdpath("config")
    }
end)
vim.keymap.set('n', '<C-p>', require("telescope.builtin").git_files)
vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end)
