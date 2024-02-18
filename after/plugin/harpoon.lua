----local mark = require("harpoon.mark")
----local ui = require("harpoon.ui")
local harpoon = require('harpoon')
--harpoon:setup({})
--
---- basic telescope configuration
--local conf = require("telescope.config").values
--local function toggle_telescope(harpoon_files)
--  local file_paths = {}
--  for _, item in ipairs(harpoon_files.items) do
--    table.insert(file_paths, item.value)
--  end
--
--  require("telescope.pickers").new({}, {
--    prompt_title = "Harpoon",
--    finder = require("telescope.finders").new_table({
--      results = file_paths,
--    }),
--    previewer = conf.file_previewer({}),
--    sorter = conf.generic_sorter({}),
--  }):find()
--end
--
--vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--  { desc = "Open harpoon window" }) --vim.keymap.set("n", "<leader>a", function() toggle_telescope(harpoon:list():append()) end)
----vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
--vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
--vim.keymap.set("n", "<C-h>", function() toggle_telescope(harpoon:list():select(1)) end)
--vim.keymap.set("n", "<C-j>", function() toggle_telescope(harpoon:list():select(2)) end)
--vim.keymap.set("n", "<C-k>", function() toggle_telescope(harpoon:list():select(3)) end)
--vim.keymap.set("n", "<C-l>", function() toggle_telescope(harpoon:list():select(4)) end)
--vim.keymap.set("n", "<C-;>", function() toggle_telescope(harpoon:list():select(5)) end)
--
--
--vim.keymap.set("n", "<C-S-P>", function() toggle_telescope(harpoon:list():prev()) end)
--vim.keymap.set("n", "<C-S-N>", function() toggle_telescope(harpoon:list():next()) end)
--

--without telescoplocal harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
  settings = {
    save_on_toggle = true,
    save_on_ui_close = true,
    key = function()
      return vim.loop.cwd()
    end,
  }
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
