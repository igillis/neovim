vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-format-on-save", { clear = true }),
	callback = function(args)
		-- local clients = vim.lsp.buf_get_clients()
		-- local formatter = nil
		-- for _, client in ipairs(clients) do
		-- 	if client.server_capabilities.documentFormattingProvider then
		-- 		formatter = client
		-- 	end
		-- end
		-- if formatter then
		-- vim.print("Formatter: " .. formatter.name)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = args.buf,
			callback = function()
				vim.lsp.buf.format({ async = false, id = args.data.client_id, timeout = 4000 })
			end,
		})
		-- else
		-- 	vim.print("No formatter for current buffer")
		-- end
	end,
})
