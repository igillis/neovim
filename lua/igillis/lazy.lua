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
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', lazy = true, config = false},
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
	},

	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	-- number 
	{ "sitiom/nvim-numbertoggle" },

	-- neo tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		opts = {
				filesystem = {
					follow_current_file = {
						enabled = true,
						leave_dirs_open = false,
					}
				}
		}
	},

	-- match closing html tags
	{
		'windwp/nvim-ts-autotag',
		config = function ()
			require('nvim-ts-autotag').setup({
				filetypes = { "html" , "xml", "eruby", "embedded_template", "svelte" }
			})
		end
	},


})
