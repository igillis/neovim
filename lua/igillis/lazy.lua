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
	-- Color schemes
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Colors and formatting
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

	-- File navigations
	{
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{ "ThePrimeagen/harpoon" },

	-- Code history
	{ "mbbill/undotree"},

	-- Git integration
	{"tpope/vim-fugitive"},

	-- Manage lsps/daps/formatters
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},

	-- Requirements for lsp-zero
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},

	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	}
})
