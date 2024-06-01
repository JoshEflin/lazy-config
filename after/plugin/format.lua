local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
    exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
    },
    formatter_by_ft = {
        css = formatters.lsp,
        html = formatters.lsp,
        java = formatters.lsp,
        javascript = formatters.lsp,
        json = formatters.lsp,
        lua = formatters.lsp,
        markdown = formatters.lsp,
        openscad = formatters.lsp,
        python = formatters.black,
        rust = formatters.lsp,
        scad = formatters.lsp,
        scss = formatters.lsp,
        sh = formatters.shfmt,
        terraform = formatters.lsp,
        typescript = formatters.lsp,
        typescriptreact = formatters.lsp,
        yaml = formatters.lsp,

        -- Add your own shell formatters:
        --    myfiletype = formatters.shell({ cmd = { "myformatter", "%" } }),

        -- Add lazy formatter that will only run when formatting:
        my_custom_formatter = function()
            if vim.api.nvim_buf_get_name(0):match("/README.md$") then
                return formatters.lsp()
            else
                return formatters.lsp()
            end
        end,


    }
})
