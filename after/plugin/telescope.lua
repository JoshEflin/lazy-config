
local builtin = require('telescope.builtin')

-- Define key mappings using vim.api.nvim_set_keymap
vim.api.nvim_set_keymap('n', '<leader>pf', ':lua require("telescope.builtin").find_files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', ':lua require("telescope.builtin").git_files()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':lua require("telescope.builtin").grep_string({search=vim.fn.input("Grep > ")})<CR>', { noremap = true, silent = true })

