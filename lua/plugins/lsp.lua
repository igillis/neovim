return {
  -- Manage lsps/daps/formatters
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "tsserver", "solargraph", "standardrb", "html", "bashls", "tailwindcss" },
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      require("lsp-zero").extend_lspconfig()

      lspconfig.lua_ls.setup({})

      -- For new Rails projects, need to do the following:
      --
      -- 	gem install solargraph
      -- 	gem install solargraph-rails
      -- 		Follow instructions here https://github.com/iftheshoefritz/solargraph-rails
      -- 	Follow instructions here to set up standardrb with solargraph:
      -- 		https://github.com/bekicot/solargraph-standardrb
      lspconfig.solargraph.setup({
        cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", "stdio" },
        settings = {
          autoformat = false,
          completion = true,
          diagnostic = false,
          folding = true,
          references = true,
          rename = true,
          symbols = true,
        },
        on_attach = function(client)
          client.server_capabilities.documentRangeFormattingProvider = false
          client.server_capabilities.documentFormattingProvider = false
        end,
      })
      lspconfig.standardrb.setup({})

      lspconfig.tsserver.setup({})
      lspconfig.html.setup({})
      lspconfig.bashls.setup({})
      lspconfig.tailwindcss.setup({})
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gD", function()
          vim.lsp.buf.declaration()
        end, opts)
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "[d", function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>ca", function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>vrr", function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>vrn", function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)
      end)
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      local lsp_zero = require("lsp-zero")
      cmp.setup({
        sources = {
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip", keyword_length = 2 },
          { name = "buffer",  keyword_length = 3 },
        },
        formatting = lsp_zero.cmp_format({ details = false }),
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
      })

      -- TODO: finish making tailwind colorizer work with lsp_zero
      -- cmp.config.formatting = {
      -- 	format = require("tailwindcss-colorizer-cmp").formatter,
      -- }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  -- {
  --   "linrongbin16/lsp-progress.nvim",
  --   config = function()
  --     require("lsp-progress").setup()
  --   end,
  -- },
}
