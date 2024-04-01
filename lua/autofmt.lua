vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	callback = function(args)
		local clients = vim.lsp.buf_get_clients()
		local formatter_id = nil
		for id, client in ipairs(clients) do
			if client.server_capabilities.documentFormattingProvider then
				formatter_id = id
			end
		end
		print("formatting lsp id", formatter_id)
		if formatter_id then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ async = false, id = formatter_id })
				end,
			})
		end
	end,
})
