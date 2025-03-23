local oil = require("oil")
oil.setup({
  default_file_explorer = true,
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = {
      "actions.select",
      opts = { vertical = true },
      desc = "Open the entry in a vertical split",
    },
    -- ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    -- ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = {
      "actions.cd",
      opts = { scope = "tab" },
      desc = ":tcd to the current oil directory",
    },
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    -- ["g\\"] = "actions.toggle_trash",
  },
  -- Set to false to disable all of the above keymaps
  use_default_keymaps = false,
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  buf_options = {
    buflisted = false,
    bufhidden = "hide",
  },
  win_options = {
    wrap = false,
    signcolumn = "yes",
    cursorcolumn = false,
  },
  delete_to_trash = true,
  lsp_file_methods = {
    timeout_ms = 1000,
    autosave_changes = true,
  },
  contraint_cursor = "editable",
  expreimental_watch_for_changes = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _)
      return name == ".."
    end,
    natural_order = true,
    git = {
      mv = function()
        return true
      end,
    },
  },
})

vim.keymap.set(
  "n",
  "-",
  oil.open,
  { remap = true, desc = "Open file explorer" }
)

vim.keymap.set("n", "<leader>.", function()
  local current_directory
  if vim.o.filetype == "oil" then
    current_directory = oil.get_current_dir(0)
  else
    current_directory = vim.fn.expand("%:p:h")
  end
  print("cwd: " .. current_directory)
  vim.fn.chdir(current_directory)
end, {
  desc = "Change the working directory of the neovim process to the current directory using oil",
})

-- local folder_picker = require("telescope.pickers").new({
--   cwd = "/",
--   clear = true,
--   finder = require("telescope.finders").new_job({
--     "fd",
--     "--type",
--     "d",
--     "--color",
--     "never",
--   }),
-- }, {})
--
-- vim.keymap.set("n", "<leader>bd", function()
--   folder_picker:find()
-- end, { desc = "Open directory with Oil" })

-- Goto system config
local hostname = vim.system({ "hostname" }):wait().stdout:gsub("%s+", "")
vim.keymap.set(
  "n",
  "<leader>cs",
  "<CMD>Oil /etc/nixos/hosts/" .. hostname .. "<CR>",
  { desc = "Go to the configuration directory sensible-nix system" }
)

-- Goto neovim config
local config_dir = vim.fn.stdpath("config")
vim.keymap.set(
  "n",
  "<leader>cc",
  "<CMD>Oil " .. config_dir .. "<CR>",
  { desc = "Go to the configuration directory of neovim" }
)
