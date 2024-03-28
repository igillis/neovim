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

