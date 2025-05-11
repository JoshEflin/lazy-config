return {
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xf",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",  -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
            "echasnovski/mini.pick",         -- optional
        },
        config = true
    },

    {
        { -- Add indentation guides even on blank lines
            'lukas-reineke/indent-blankline.nvim',
            -- Enable `lukas-reineke/indent-blankline.nvim`
            -- See `:help ibl`
            main = 'ibl',
            opts = {},
        },
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
        },
        cmd = 'Neotree',
        keys = {
            { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
        },
        opts = {
            filesystem = {
                window = {
                    mappings = {
                        ['\\'] = 'close_window',
                    },
                },
            },
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
        'folke/tokyonight.nvim',
        name = 'tokyonight',
        config = function()
            vim.cmd('colorscheme tokyonight')
        end
    },
    {
        "mfussenegger/nvim-dap",
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "mfussenegger/nvim-dap" },
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = { "mfussenegger/nvim-dap" },
    },
    {
        "microsoft/vscode-js-debug",
        opt = true,
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
        version = "1.*",
    },

    {
        "mxsdev/nvim-dap-vscode-js",
        config = function()
            require("dap-vscode-js").setup({
                debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),
            })
        end,

        requires = { "mfussenegger/nvim-dap" }
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
        config = function()
            require("mason-nvim-dap").setup({})
        end,
    },
    {
        "Joakker/lua-json5",
        build = "./install.sh",
    },
    { 'laytan/cloak.nvim' },
    { 'lukas-reineke/lsp-format.nvim' },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-treesitter/playground' },
    { "ellisonleao/dotenv.nvim" },
    {
        'theprimeagen/harpoon',
        branch = 'harpoon2',
        requires = { 'nvim-lua/plenary.nvim' },
    },
    { 'mbbill/undotree' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-nvim-lua' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'elentok/format-on-save.nvim' },
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
}
