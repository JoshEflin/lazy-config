
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

local plugins = {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function ()
      vim.cmd('colorscheme tokyonight')
    end
  },
  {'lukas-reineke/lsp-format.nvim'},
  {'nvim-treesitter/nvim-treesitter' },
  {'nvim-treesitter/playground'},
  {'theprimeagen/vim-apm'},
  {'theprimeagen/harpoon'},
  {'mbbill/undotree'},
  {'tpope/vim-fugitive'},
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      {'hrsh7th/nvim-cmp'},                   -- Required
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-nvim-lsp'},               -- Required
      {'hrsh7th/cmp-nvim-lua'},               -- Required
      {'L3MON4D3/LuaSnip'},                   -- Required
      {'saadparwaiz1/cmp_luasnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
}

vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins)

