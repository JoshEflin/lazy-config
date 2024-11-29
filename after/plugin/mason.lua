require('mason').setup()
require('mason-nvim-dap').setup({
    ensure_installed = { "go", "typescript", "javascript", "ocaml" },
    automatic_installation = true,
})
