return {
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
		},
		config = function() 
			vim.keymap.set("n", "<leader>t", function()
					require("neo-tree.command").execute({
						action = "focus",
						source = "filesystem",
						position = "left",
						toggle = true,
						reveal = true,
						reveal_force_cwd = true,
					})
				end
			)
		end
	},
}