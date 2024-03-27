local root_files = {'Gemfile', '.git'}
local paths = vim.fs.find(root_files, {stop = vim.env.HOME})
local root_dir = vim.fs.dirname(paths[1])

if root_dir then
	print("Starting ruby-lsp with root_dir ", root_dir)
	vim.lsp.start({
		cmd = {'ruby-lsp'},
		root_dir = root_dir,
	})
end
