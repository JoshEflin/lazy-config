local dapui = require "dapui"

dapui.setup({
    layouts = {
        {
            elements = { "scopes", "breakpoints", "stacks", "watches" },
            size = 40,
            position = "left",
        },
        {
            elements = { "repl", "console" },
            size = 10,
            position = "bottom",
        },
    },
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

local toggleOpts = { desc = "Dap UI" }
local evalOpts = { desc = "Eval", mode = { "n", "v" } }

vim.keymap.set("n", "<leader>du", dapui.toggle, toggleOpts)
vim.keymap.set("n", "<leader>de", dapui.eval, evalOpts)
