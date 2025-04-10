return {
  "VonHeikemen/fine-cmdline.nvim",
  enabled = false,
  dependencies = {
    { "MunifTanjim/nui.nvim" },
  },
  config = function()
    require("fine-cmdline").setup()

    vim.api.nvim_set_keymap(
      "n",
      ":",
      "<cmd>FineCmdline<CR>",
      { noremap = true }
    )
    vim.api.nvim_set_keymap(
      "v",
      ":",
      "<cmd>FineCmdline '<,'><CR>",
      { noremap = true }
    )
  end,
}
