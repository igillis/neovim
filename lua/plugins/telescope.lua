return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git" } })
      end, { noremap = true })
      vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
      vim.keymap.set("n", "<leader>gr", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end,
  },
}
