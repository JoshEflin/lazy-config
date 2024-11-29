-- Ensure dap-virtual-text is loaded
local ok_dap_virtual_text, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not ok_dap_virtual_text then
    vim.notify("nvim-dap-virtual-text not found", vim.log.levels.ERROR)
    return
end

-- Setup virtual text
dap_virtual_text.setup()
