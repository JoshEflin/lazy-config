-- Ensure dap is loaded
local ok_dap, dap = pcall(require, "dap")
if not ok_dap then
  vim.notify("nvim-dap not found", vim.log.levels.ERROR)
  return
end

-- Keybindings
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>c", dap.continue, opts)
vim.keymap.set("n", "<leader>o", dap.step_over, opts)
vim.keymap.set("n", "<leader>i", dap.step_into, opts)
vim.keymap.set("n", "<leader>O", dap.step_out, opts)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, opts)
vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, opts)
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, opts)
vim.keymap.set("n", "<Leader>dr", dap.repl.open, opts)
vim.keymap.set("n", "<Leader>dl", dap.run_last, opts)

-- Language-specific configurations (example for Go)
local ok_dap_go, dap_go = pcall(require, "dap-go")
if ok_dap_go then
  dap_go.setup()
else
  vim.notify("nvim-dap-go not found", vim.log.levels.WARN)
end
