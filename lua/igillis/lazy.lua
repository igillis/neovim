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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "ThePrimeagen/harpoon" },
	{ "mbbill/undotree"},
	{"tpope/vim-fugitive"}
})
