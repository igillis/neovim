return {
	{
		"tpope/vim-rails",
		-- disable autocmd set filetype=eruby.yaml
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "eruby.yaml",
				command = "set filetype=yaml",
			})
		end,
	},
}
