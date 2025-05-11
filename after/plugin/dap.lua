local dapui = require "dapui"
-- Ensure dap is loaded
local ok_dap, dap = pcall(require, "dap")
if not ok_dap then
    vim.notify("nvim-dap not found", vim.log.levels.ERROR)
    return
end
require("dap-vscode-js").setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    debugger_path = os.getenv('HOME') .. '/.local/share/nvim/lazy/vscode-js-debug',              -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

dapui.setup({
    icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    controls = {
        icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
        },
    },
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

local function load_env_if_exists(filepath)
    local env_path = vim.fn.getcwd() .. filepath
    local f = io.open(env_path, "r")
    if f then
        f:close()
        require("dotenv").setup({
            verbose = true, file_name = '.env', enable_on_load = true
        })
    end
end
local function get_env_vars()
    load_env_if_exists('.env')
    return vim.fn.environ() -- this returns a Lua table of env vars
end

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
local evalOpts = { desc = "Eval" }
vim.keymap.set("n", "<leader>du", dapui.toggle, toggleOpts)
vim.keymap.set({ "n", "v" }, "<leader>de", dapui.eval, evalOpts)


for _, language in ipairs({ "typescript", "javascript", "cs" }) do
    local envs = get_env_vars()
    --i need some enum for  languages
    dap.configurations[language] = {

        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            env = envs
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require 'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        }
    }
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
