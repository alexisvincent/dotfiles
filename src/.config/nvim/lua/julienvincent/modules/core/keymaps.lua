local M = {}


M.setup = function()
  local saving = require("julienvincent.modules.core.auto-save")
  local lazy = require("lazy")
  local wk = require("which-key")

  local map = vim.keymap.set

  local movement_modes = {"n", "i", "v", "x", "c" }

  map(movement_modes, "<C-h>", "<Left>", { noremap = false  })
  map(movement_modes, "<C-j>", "<Down>", { noremap = false })
  map(movement_modes, "<C-k>", "<Up>", { noremap = false })
  map(movement_modes, "<C-l>", "<Right>", { noremap = false })

  wk.add({
    {"<leader>w", group = "+window"}
  })
  ---- Move to window using <ctrl>-hjkl
  vim.keymap.set({"n"}, "<leader>wh", "<C-w>h",{desc="Go to window left"})
  vim.keymap.set({"n"}, "<leader>wj", "<C-w>j", {desc="Go to window lower"})
  vim.keymap.set({"n"}, "<leader>wk", "<C-w>k", {desc="Go to window upper"})
  vim.keymap.set({"n"}, "<leader>wl", "<C-w>l", {desc="Go to window right"})

  wk.add({
    {"<leader>q", group = "+quit"}
  })

  map("n", "<leader>qq", function()
    saving.write_all_buffers()
    vim.api.nvim_command("qa")
  end, { desc = "Save and quit" })

  map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

  -- tabs
  map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Next Tab" })
  map("n", "<leader><tab><Right>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
  map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
  map("n", "<leader><tab><Left>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

  vim.api.nvim_set_keymap("n", "<S-Down>", "<Nop>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<S-Up>", "<Nop>", { noremap = true, silent = true })

  map("n", "<leader>LL", lazy.show, { desc = "Show Lazy" })

  map("v", "<localleader>s", '"zy:%s/<C-r>z//g<Left><Left>', {
    noremap = true,
    desc = "Replace selection",
  })

  map("n", "gx", [[:execute '!open ' . shellescape(expand('<cfile>'), 1)<CR>]], {
    noremap = true,
    silent = true,
    desc = "Open URI under cursor",
  })
end

return M
