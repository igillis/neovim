-- Set line numbers on
vim.o.nu = true

-- Code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- Ignore case in search by default
vim.opt.ignorecase = true
